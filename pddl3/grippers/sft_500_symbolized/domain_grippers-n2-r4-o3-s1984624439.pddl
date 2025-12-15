(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_3 ?v5 - type_3 ?v8 - type_2)
 	      (pred_2 ?v6 - object ?v8 - type_2)
	      (pred_4 ?v5 - type_3 ?v4 - type_1)
	      (pred_1 ?v5 - type_3 ?v6 - object ?v4 - type_1))

   (:action op_3
       :parameters  (?v5 - type_3 ?v1 ?v7 - type_2)
       :precondition (and  (pred_3 ?v5 ?v1))
       :effect (and  (pred_3 ?v5 ?v7)
		     (not (pred_3 ?v5 ?v1))))

   (:action op_1
       :parameters (?v5 - type_3 ?v2 - object ?v3 - type_2 ?v4 - type_1)
       :precondition  (and  (pred_2 ?v2 ?v3) (pred_3 ?v5 ?v3) (pred_4 ?v5 ?v4))
       :effect (and (pred_1 ?v5 ?v2 ?v4)
		    (not (pred_2 ?v2 ?v3)) 
		    (not (pred_4 ?v5 ?v4))))

   (:action op_2
       :parameters (?v5 - type_3 ?v2 - object ?v3 - type_2 ?v4 - type_1)
       :precondition  (and  (pred_1 ?v5 ?v2 ?v4) (pred_3 ?v5 ?v3))
       :effect (and (pred_2 ?v2 ?v3)
		    (pred_4 ?v5 ?v4)
		    (not (pred_1 ?v5 ?v2 ?v4)))))