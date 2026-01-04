(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_1 ?v7 - type_2 ?v4 - type_1)
 	      (pred_4 ?v5 - object ?v4 - type_1)
	      (pred_2 ?v7 - type_2 ?v3 - type_3)
	      (pred_3 ?v7 - type_2 ?v5 - object ?v3 - type_3))

   (:action op_1
       :parameters  (?v7 - type_2 ?v6 ?v1 - type_1)
       :precondition (and  (pred_1 ?v7 ?v6))
       :effect (and  (pred_1 ?v7 ?v1)
		     (not (pred_1 ?v7 ?v6))))

   (:action op_2
       :parameters (?v7 - type_2 ?v2 - object ?v8 - type_1 ?v3 - type_3)
       :precondition  (and  (pred_4 ?v2 ?v8) (pred_1 ?v7 ?v8) (pred_2 ?v7 ?v3))
       :effect (and (pred_3 ?v7 ?v2 ?v3)
		    (not (pred_4 ?v2 ?v8)) 
		    (not (pred_2 ?v7 ?v3))))

   (:action op_3
       :parameters (?v7 - type_2 ?v2 - object ?v8 - type_1 ?v3 - type_3)
       :precondition  (and  (pred_3 ?v7 ?v2 ?v3) (pred_1 ?v7 ?v8))
       :effect (and (pred_4 ?v2 ?v8)
		    (pred_2 ?v7 ?v3)
		    (not (pred_3 ?v7 ?v2 ?v3)))))