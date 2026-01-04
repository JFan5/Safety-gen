(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_1 ?v7 - type_2 ?v8 - type_1)
 	      (pred_3 ?v6 - object ?v8 - type_1)
	      (pred_4 ?v7 - type_2 ?v2 - type_3)
	      (pred_2 ?v7 - type_2 ?v6 - object ?v2 - type_3))

   (:action op_3
       :parameters  (?v7 - type_2 ?v3 ?v1 - type_1)
       :precondition (and  (pred_1 ?v7 ?v3))
       :effect (and  (pred_1 ?v7 ?v1)
		     (not (pred_1 ?v7 ?v3))))

   (:action op_2
       :parameters (?v7 - type_2 ?v5 - object ?v4 - type_1 ?v2 - type_3)
       :precondition  (and  (pred_3 ?v5 ?v4) (pred_1 ?v7 ?v4) (pred_4 ?v7 ?v2))
       :effect (and (pred_2 ?v7 ?v5 ?v2)
		    (not (pred_3 ?v5 ?v4)) 
		    (not (pred_4 ?v7 ?v2))))

   (:action op_1
       :parameters (?v7 - type_2 ?v5 - object ?v4 - type_1 ?v2 - type_3)
       :precondition  (and  (pred_2 ?v7 ?v5 ?v2) (pred_1 ?v7 ?v4))
       :effect (and (pred_3 ?v5 ?v4)
		    (pred_4 ?v7 ?v2)
		    (not (pred_2 ?v7 ?v5 ?v2)))))