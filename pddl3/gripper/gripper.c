/*********************************************************************
 * (C) Copyright 2001 Albert Ludwigs University Freiburg
 *     Institute of Computer Science
 *
 * All rights reserved. Use of this software is permitted for 
 * non-commercial research purposes, and it may be copied only 
 * for that use.  All copies must include this copyright message.
 * This software is made available AS IS, and neither the authors
 * nor the  Albert Ludwigs University Freiburg make any warranty
 * about the software or its performance. 
 *********************************************************************/

/* 
 * Enhanced C code for generating gripper problems
 * Backward-compatible with original:
 *   -n <num>                         (balls, minimal 1)
 * New options:
 *   -R <rooms>                       (rooms count, default 2)
 *   -cap <1|2>                       (gripper capacity, default 2)
 *   -seed <uint>                     (random seed; default time(NULL))
 *   -init <rand|r1:v1,r2:v2,...>     (initial distribution; default all in rooma)
 *   -goal <all@rK|rand|r1:v1,...>    (goal distribution; default all in roomb)
 */

 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
 #include <time.h>
 #include <ctype.h>
 
 typedef unsigned char Bool;
 #define TRUE 1
 #define FALSE 0
 
 /* ---------- Globals ---------- */
 int gobjects = -1;           /* -n : number of balls */
 int groom_count = 2;         /* -R : number of rooms (>=1) */
 int gcapacity = 2;           /* -cap : number of grippers (1 or 2) */
 unsigned int gseed = 0;      /* -seed : rng seed; 0 => time(NULL) */
 
 #define MAX_ROOMS 64
 int init_count[MAX_ROOMS];
 int goal_count[MAX_ROOMS];
 
 typedef enum {
   DIST_DEFAULT = 0,   /* for init: all in rooma; for goal: all in roomb (if R>=2) */
   DIST_RAND,
   DIST_SPEC,
   DIST_ALL_TO_ONE      /* goal only: all@rK */
 } DistMode;
 
 DistMode init_mode = DIST_DEFAULT;
 DistMode goal_mode = DIST_DEFAULT;
 
 /* we parse args first; then interpret -init/-goal */
 char gInitArg[1024] = {0};
 char gGoalArg[1024] = {0};
 
 /* ---------- Helpers ---------- */
 static void usage(void) {
   printf("\nusage:\n");
   printf("\nOPTIONS   DESCRIPTIONS\n\n");
   printf("-n <num>                 number of balls (minimal 1)\n");
   printf("-R <rooms>               number of rooms (>=1, default 2)\n");
   printf("-cap <1|2>               gripper capacity / count (default 2)\n");
   printf("-seed <uint>             RNG seed (default: time(NULL))\n");
   printf("-init <rand|spec>        initial distribution:\n");
   printf("                         rand                -> random over rooms\n");
   printf("                         r1:v1,r2:v2,...     -> explicit counts (sum==n)\n");
   printf("-goal <all@rK|rand|spec> goal distribution:\n");
   printf("                         all@rK              -> all balls to room K (1..R)\n");
   printf("                         rand                -> random over rooms\n");
   printf("                         r1:v1,r2:v2,...     -> explicit counts (sum==n)\n");
   printf("\nExamples:\n");
   printf("  ./gripper -n 6                         (legacy: all in rooma -> all to roomb)\n");
   printf("  ./gripper -n 6 -R 3 -init rand -goal all@r3\n");
   printf("  ./gripper -n 6 -R 4 -init r1:3,r2:2,r4:1 -goal rand\n\n");
 }
 
 /* room name printer (legacy names for first two) */
 static void print_room_symbol(int r) {
   if (r == 0) printf("rooma");
   else if (r == 1) printf("roomb");
   else printf("room%d", r+1);
 }
 
 static const char* room_symbol_const(int r) {
   /* returns static buffer pointer; use immediately */
   static char buf[32];
   if (r == 0) return "rooma";
   if (r == 1) return "roomb";
   snprintf(buf, sizeof(buf), "room%d", r+1);
   return buf;
 }
 
 /* trim spaces in-place */
 static void trim(char* s) {
   if (!s) return;
   size_t len = strlen(s);
   size_t i = 0;
   while (i < len && isspace((unsigned char)s[i])) i++;
   if (i > 0) memmove(s, s+i, len - i + 1);
   len = strlen(s);
   while (len > 0 && isspace((unsigned char)s[len-1])) { s[len-1] = '\0'; len--; }
 }
 
 /* parse spec string like "r1:3,r2:2" into counts[], check total==expected_total */
 static Bool parse_spec_counts(const char* spec, int* counts, int room_count, int expected_total, const char** err) {
   static char buf[1024];
   if (!spec) { if (err) *err = "null spec"; return FALSE; }
   if (room_count < 1 || room_count > MAX_ROOMS) { if (err) *err = "invalid room_count"; return FALSE; }
 
   memset(counts, 0, sizeof(int)*MAX_ROOMS);
   strncpy(buf, spec, sizeof(buf)-1);
   buf[sizeof(buf)-1] = '\0';
 
   char* save = NULL;
   char* tok = strtok_r(buf, ",", &save);
   int sum = 0;
   while (tok) {
     trim(tok);
     if (*tok == '\0') { tok = strtok_r(NULL, ",", &save); continue; }
     /* expect rK:v or Rk:v (case-insensitive 'r') */
     if (tok[0] != 'r' && tok[0] != 'R') { if (err) *err = "token must start with r"; return FALSE; }
     char* p = (char*)tok + 1;
     if (!isdigit((unsigned char)*p)) { if (err) *err = "missing room index after r"; return FALSE; }
     int K = (int)strtol(p, &p, 10);
     if (K < 1 || K > room_count) { if (err) *err = "room index out of range"; return FALSE; }
     if (*p != ':') { if (err) *err = "missing ':' after room index"; return FALSE; }
     p++;
     if (!isdigit((unsigned char)*p)) { if (err) *err = "missing count after ':'"; return FALSE; }
     int v = (int)strtol(p, &p, 10);
     if (v < 0) { if (err) *err = "negative count"; return FALSE; }
     if (*p != '\0') { if (err) *err = "garbage after count"; return FALSE; }
     counts[K-1] += v;
     sum += v;
     tok = strtok_r(NULL, ",", &save);
   }
   if (sum != expected_total) { if (err) *err = "sum != number of balls"; return FALSE; }
   return TRUE;
 }
 
 /* parse goal all@rK -> K (1..R), else -1 */
 static int parse_all_to_one(const char* s) {
   if (!s) return -1;
   if (strncmp(s, "all@r", 5) != 0 && strncmp(s, "ALL@R", 5) != 0) return -1;
   const char* p = s + 5;
   if (!isdigit((unsigned char)*p)) return -1;
   int K = (int)strtol(p, NULL, 10);
   return K;
 }
 
 /* ---------- CLI ---------- */
 static Bool process_command_line(int argc, char *argv[]) {
   if (argc == 1 || (argc == 2 && argv[1] && strcmp(argv[1], "?") == 0)) return FALSE;
 
   for (int i = 1; i < argc; ++i) {
     if (argv[i][0] != '-') { return FALSE; }
     if (strcmp(argv[i], "-n") == 0) {
       if (++i >= argc) return FALSE;
       gobjects = atoi(argv[i]);
     } else if (strcmp(argv[i], "-R") == 0) {
       if (++i >= argc) return FALSE;
       groom_count = atoi(argv[i]);
     } else if (strcmp(argv[i], "-cap") == 0) {
       if (++i >= argc) return FALSE;
       gcapacity = atoi(argv[i]);
     } else if (strcmp(argv[i], "-seed") == 0) {
       if (++i >= argc) return FALSE;
       gseed = (unsigned int)strtoul(argv[i], NULL, 10);
     } else if (strcmp(argv[i], "-init") == 0) {
       if (++i >= argc) return FALSE;
       strncpy(gInitArg, argv[i], sizeof(gInitArg)-1);
       gInitArg[sizeof(gInitArg)-1] = '\0';
     } else if (strcmp(argv[i], "-goal") == 0) {
       if (++i >= argc) return FALSE;
       strncpy(gGoalArg, argv[i], sizeof(gGoalArg)-1);
       gGoalArg[sizeof(gGoalArg)-1] = '\0';
     } else {
       return FALSE;
     }
   }
 
   if (gobjects < 1) return FALSE;
   if (groom_count < 1 || groom_count > MAX_ROOMS) return FALSE;
   if (gcapacity < 1) gcapacity = 1;
   if (gcapacity > 2) gcapacity = 2;
   return TRUE;
 }
 
 /* ---------- Main ---------- */
 int main(int argc, char *argv[]) {
   if (!process_command_line(argc, argv)) {
     usage();
     return 1;
   }
 
   /* RNG */
   if (gseed == 0) gseed = (unsigned int)time(NULL);
   srand(gseed);
 
   /* interpret -init */
   memset(init_count, 0, sizeof(init_count));
   if (gInitArg[0] == '\0') {
     init_mode = DIST_DEFAULT;                   /* legacy: all in rooma */
     init_count[0] = gobjects;
   } else {
     if (strcasecmp(gInitArg, "rand") == 0) {
       init_mode = DIST_RAND;
       for (int i = 0; i < gobjects; ++i) init_count[rand() % groom_count]++;
     } else {
       init_mode = DIST_SPEC;
       const char* err = NULL;
       if (!parse_spec_counts(gInitArg, init_count, groom_count, gobjects, &err)) {
         fprintf(stderr, "Error parsing -init: %s\n", err ? err : "invalid spec");
         return 2;
       }
     }
   }
 
   /* interpret -goal */
   memset(goal_count, 0, sizeof(goal_count));
   if (gGoalArg[0] == '\0') {
     goal_mode = DIST_DEFAULT;                   /* legacy: all to roomb (if exists) */
     if (groom_count >= 2) goal_count[1] = gobjects;
     else goal_count[0] = gobjects;
   } else {
     int k = parse_all_to_one(gGoalArg);
     if (k >= 1) {
       goal_mode = DIST_ALL_TO_ONE;
       if (k > groom_count) {
         fprintf(stderr, "Error parsing -goal: room index out of range in %s\n", gGoalArg);
         return 2;
       }
       goal_count[k-1] = gobjects;
     } else if (strcasecmp(gGoalArg, "rand") == 0) {
       goal_mode = DIST_RAND;
       for (int i = 0; i < gobjects; ++i) goal_count[rand() % groom_count]++;
     } else {
       goal_mode = DIST_SPEC;
       const char* err = NULL;
       if (!parse_spec_counts(gGoalArg, goal_count, groom_count, gobjects, &err)) {
         fprintf(stderr, "Error parsing -goal: %s\n", err ? err : "invalid spec");
         return 2;
       }
     }
   }
 
   /* ---------- Output PDDL ---------- */
   printf("\n\n\n");
   printf("(define (problem gripper-%d)", gobjects);
   printf("\n(:domain gripper-strips)");
 
   /* objects */
   printf("\n(:objects ");
   /* rooms */
   for (int r = 0; r < groom_count; ++r) {
     printf("%s ", room_symbol_const(r));
   }
   /* grippers */
   if (gcapacity >= 1) printf("left ");
   if (gcapacity >= 2) printf("right ");
   /* balls */
   for (int i = 0; i < gobjects; ++i) printf("ball%d ", i+1);
   printf(")");
 
   /* init */
   printf("\n(:init");
   /* rooms facts */
   for (int r = 0; r < groom_count; ++r) {
     printf("\n(room %s)", room_symbol_const(r));
   }
   /* grippers as objects */
   if (gcapacity >= 1) printf("\n(gripper left)");
   if (gcapacity >= 2) printf("\n(gripper right)");
   /* balls */
   for (int i = 0; i < gobjects; ++i) printf("\n(ball ball%d)", i+1);
   /* free hands */
   if (gcapacity >= 1) printf("\n(free left)");
   if (gcapacity >= 2) printf("\n(free right)");
   /* place balls according to init_count (ball ids assigned sequentially by room) */
   int idx = 1;
   for (int r = 0; r < groom_count; ++r) {
     for (int k2 = 0; k2 < init_count[r]; ++k2, ++idx) {
       printf("\n(at ball%d %s)", idx, room_symbol_const(r));
     }
   }
   /* robby starts at rooma (legacy) */
   printf("\n(at-robby rooma)");
   printf("\n)");
 
   /* goal */
   printf("\n(:goal");
   printf("\n(and");
   idx = 1;
   for (int r = 0; r < groom_count; ++r) {
     for (int k2 = 0; k2 < goal_count[r]; ++k2, ++idx) {
       printf("\n(at ball%d %s)", idx, room_symbol_const(r));
     }
   }
   printf("\n)");
   printf("\n)");
 
   printf("\n)");
   printf("\n\n\n");
 
   return 0;
 }
 