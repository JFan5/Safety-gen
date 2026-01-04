(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_1 ?v5 - type_3 ?v4 - type_1)
 	      (pred_3 ?v6 - object ?v4 - type_1)
	      (pred_2 ?v5 - type_3 ?v8 - type_2)
	      (pred_4 ?v5 - type_3 ?v6 - object ?v8 - type_2))

   (:action op_1
       :parameters  (?v5 - type_3 ?v2 ?v3 - type_1)
       :precondition (and  (pred_1 ?v5 ?v2))
       :effect (and  (pred_1 ?v5 ?v3)
		     (not (pred_1 ?v5 ?v2))))

   (:action op_2
       :parameters (?v5 - type_3 ?v1 - object ?v7 - type_1 ?v8 - type_2)
       :precondition  (and  (pred_3 ?v1 ?v7) (pred_1 ?v5 ?v7) (pred_2 ?v5 ?v8))
       :effect (and (pred_4 ?v5 ?v1 ?v8)
		    (not (pred_3 ?v1 ?v7)) 
		    (not (pred_2 ?v5 ?v8))))

   (:action op_3
       :parameters (?v5 - type_3 ?v1 - object ?v7 - type_1 ?v8 - type_2)
       :precondition  (and  (pred_4 ?v5 ?v1 ?v8) (pred_1 ?v5 ?v7))
       :effect (and (pred_3 ?v1 ?v7)
		    (pred_2 ?v5 ?v8)
		    (not (pred_4 ?v5 ?v1 ?v8)))))