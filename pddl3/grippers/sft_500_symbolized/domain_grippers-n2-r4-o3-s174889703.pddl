(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_1 ?v1 - type_3 ?v8 - type_1)
 	      (pred_4 ?v6 - object ?v8 - type_1)
	      (pred_2 ?v1 - type_3 ?v4 - type_2)
	      (pred_3 ?v1 - type_3 ?v6 - object ?v4 - type_2))

   (:action op_2
       :parameters  (?v1 - type_3 ?v5 ?v3 - type_1)
       :precondition (and  (pred_1 ?v1 ?v5))
       :effect (and  (pred_1 ?v1 ?v3)
		     (not (pred_1 ?v1 ?v5))))

   (:action op_3
       :parameters (?v1 - type_3 ?v2 - object ?v7 - type_1 ?v4 - type_2)
       :precondition  (and  (pred_4 ?v2 ?v7) (pred_1 ?v1 ?v7) (pred_2 ?v1 ?v4))
       :effect (and (pred_3 ?v1 ?v2 ?v4)
		    (not (pred_4 ?v2 ?v7)) 
		    (not (pred_2 ?v1 ?v4))))

   (:action op_1
       :parameters (?v1 - type_3 ?v2 - object ?v7 - type_1 ?v4 - type_2)
       :precondition  (and  (pred_3 ?v1 ?v2 ?v4) (pred_1 ?v1 ?v7))
       :effect (and (pred_4 ?v2 ?v7)
		    (pred_2 ?v1 ?v4)
		    (not (pred_3 ?v1 ?v2 ?v4)))))