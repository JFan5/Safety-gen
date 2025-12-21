(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_1 ?v5 - type_2 ?v6 - type_1)
 	      (pred_4 ?v8 - object ?v6 - type_1)
	      (pred_2 ?v5 - type_2 ?v1 - type_3)
	      (pred_3 ?v5 - type_2 ?v8 - object ?v1 - type_3))

   (:action op_3
       :parameters  (?v5 - type_2 ?v2 ?v3 - type_1)
       :precondition (and  (pred_1 ?v5 ?v2))
       :effect (and  (pred_1 ?v5 ?v3)
		     (not (pred_1 ?v5 ?v2))))

   (:action op_1
       :parameters (?v5 - type_2 ?v7 - object ?v4 - type_1 ?v1 - type_3)
       :precondition  (and  (pred_4 ?v7 ?v4) (pred_1 ?v5 ?v4) (pred_2 ?v5 ?v1))
       :effect (and (pred_3 ?v5 ?v7 ?v1)
		    (not (pred_4 ?v7 ?v4)) 
		    (not (pred_2 ?v5 ?v1))))

   (:action op_2
       :parameters (?v5 - type_2 ?v7 - object ?v4 - type_1 ?v1 - type_3)
       :precondition  (and  (pred_3 ?v5 ?v7 ?v1) (pred_1 ?v5 ?v4))
       :effect (and (pred_4 ?v7 ?v4)
		    (pred_2 ?v5 ?v1)
		    (not (pred_3 ?v5 ?v7 ?v1)))))