(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_4 ?v7 - type_1 ?v4 - type_3)
 	      (pred_1 ?v6 - object ?v4 - type_3)
	      (pred_3 ?v7 - type_1 ?v2 - type_2)
	      (pred_2 ?v7 - type_1 ?v6 - object ?v2 - type_2))

   (:action op_1
       :parameters  (?v7 - type_1 ?v8 ?v1 - type_3)
       :precondition (and  (pred_4 ?v7 ?v8))
       :effect (and  (pred_4 ?v7 ?v1)
		     (not (pred_4 ?v7 ?v8))))

   (:action op_3
       :parameters (?v7 - type_1 ?v5 - object ?v3 - type_3 ?v2 - type_2)
       :precondition  (and  (pred_1 ?v5 ?v3) (pred_4 ?v7 ?v3) (pred_3 ?v7 ?v2))
       :effect (and (pred_2 ?v7 ?v5 ?v2)
		    (not (pred_1 ?v5 ?v3)) 
		    (not (pred_3 ?v7 ?v2))))

   (:action op_2
       :parameters (?v7 - type_1 ?v5 - object ?v3 - type_3 ?v2 - type_2)
       :precondition  (and  (pred_2 ?v7 ?v5 ?v2) (pred_4 ?v7 ?v3))
       :effect (and (pred_1 ?v5 ?v3)
		    (pred_3 ?v7 ?v2)
		    (not (pred_2 ?v7 ?v5 ?v2)))))