#!/bin/sh
# (Use with `make`, not as a shell script.)

# ===== Compiler & Flags =====
CC       ?= gcc
CFLAGS   ?= -O3 -Wall -Wextra -pedantic -std=c99
CPPFLAGS ?= -D_POSIX_C_SOURCE=200809L
LDFLAGS  ?=
LIBS     ?= -lm

# ===== Sources & Target =====
SOURCES  := gripper.c
OBJECTS  := $(SOURCES:.c=.o)
TARGET   := gripper

# ===== Phony targets =====
.PHONY: all clean veryclean lint

# ===== Default =====
all: $(TARGET)

# ===== Build rules =====
$(TARGET): $(OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $(OBJECTS) $(LIBS)

%.o: %.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

# ===== Utilities =====
clean:
	rm -f *.o *.bak *~ *% core

veryclean: clean
	rm -f $(TARGET) H* J* K* L* O* graph.* *.symbex gmon.out \
	lex.fct_pddl.c lex.ops_pddl.c lex.probname.c *.output

lint:
	lclint -booltype Bool $(SOURCES) 2> output.lint
