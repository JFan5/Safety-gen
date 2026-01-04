(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_2 ?v4 - type_1 ?v6 - type_3)
 	      (pred_1 ?v1 - object ?v6 - type_3)
	      (pred_4 ?v4 - type_1 ?v2 - type_2)
	      (pred_3 ?v4 - type_1 ?v1 - object ?v2 - type_2))

   (:action op_2
       :parameters  (?v4 - type_1 ?v5 ?v8 - type_3)
       :precondition (and  (pred_2 ?v4 ?v5))
       :effect (and  (pred_2 ?v4 ?v8)
		     (not (pred_2 ?v4 ?v5))))

   (:action op_1
       :parameters (?v4 - type_1 ?v7 - object ?v3 - type_3 ?v2 - type_2)
       :precondition  (and  (pred_1 ?v7 ?v3) (pred_2 ?v4 ?v3) (pred_4 ?v4 ?v2))
       :effect (and (pred_3 ?v4 ?v7 ?v2)
		    (not (pred_1 ?v7 ?v3)) 
		    (not (pred_4 ?v4 ?v2))))

   (:action op_3
       :parameters (?v4 - type_1 ?v7 - object ?v3 - type_3 ?v2 - type_2)
       :precondition  (and  (pred_3 ?v4 ?v7 ?v2) (pred_2 ?v4 ?v3))
       :effect (and (pred_1 ?v7 ?v3)
		    (pred_4 ?v4 ?v2)
		    (not (pred_3 ?v4 ?v7 ?v2)))))