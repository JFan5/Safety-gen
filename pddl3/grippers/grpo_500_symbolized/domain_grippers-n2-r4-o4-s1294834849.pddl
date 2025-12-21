(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_2 ?v4 - type_1 ?v6 - type_2)
 	      (pred_1 ?v5 - object ?v6 - type_2)
	      (pred_3 ?v4 - type_1 ?v2 - type_3)
	      (pred_4 ?v4 - type_1 ?v5 - object ?v2 - type_3))

   (:action op_1
       :parameters  (?v4 - type_1 ?v8 ?v3 - type_2)
       :precondition (and  (pred_2 ?v4 ?v8))
       :effect (and  (pred_2 ?v4 ?v3)
		     (not (pred_2 ?v4 ?v8))))

   (:action op_2
       :parameters (?v4 - type_1 ?v7 - object ?v1 - type_2 ?v2 - type_3)
       :precondition  (and  (pred_1 ?v7 ?v1) (pred_2 ?v4 ?v1) (pred_3 ?v4 ?v2))
       :effect (and (pred_4 ?v4 ?v7 ?v2)
		    (not (pred_1 ?v7 ?v1)) 
		    (not (pred_3 ?v4 ?v2))))

   (:action op_3
       :parameters (?v4 - type_1 ?v7 - object ?v1 - type_2 ?v2 - type_3)
       :precondition  (and  (pred_4 ?v4 ?v7 ?v2) (pred_2 ?v4 ?v1))
       :effect (and (pred_1 ?v7 ?v1)
		    (pred_3 ?v4 ?v2)
		    (not (pred_4 ?v4 ?v7 ?v2)))))