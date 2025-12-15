(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_4 ?v4 - type_1 ?v5 - type_2)
 	      (pred_2 ?v8 - object ?v5 - type_2)
	      (pred_3 ?v4 - type_1 ?v1 - type_3)
	      (pred_1 ?v4 - type_1 ?v8 - object ?v1 - type_3))

   (:action op_3
       :parameters  (?v4 - type_1 ?v2 ?v6 - type_2)
       :precondition (and  (pred_4 ?v4 ?v2))
       :effect (and  (pred_4 ?v4 ?v6)
		     (not (pred_4 ?v4 ?v2))))

   (:action op_1
       :parameters (?v4 - type_1 ?v7 - object ?v3 - type_2 ?v1 - type_3)
       :precondition  (and  (pred_2 ?v7 ?v3) (pred_4 ?v4 ?v3) (pred_3 ?v4 ?v1))
       :effect (and (pred_1 ?v4 ?v7 ?v1)
		    (not (pred_2 ?v7 ?v3)) 
		    (not (pred_3 ?v4 ?v1))))

   (:action op_2
       :parameters (?v4 - type_1 ?v7 - object ?v3 - type_2 ?v1 - type_3)
       :precondition  (and  (pred_1 ?v4 ?v7 ?v1) (pred_4 ?v4 ?v3))
       :effect (and (pred_2 ?v7 ?v3)
		    (pred_3 ?v4 ?v1)
		    (not (pred_1 ?v4 ?v7 ?v1)))))