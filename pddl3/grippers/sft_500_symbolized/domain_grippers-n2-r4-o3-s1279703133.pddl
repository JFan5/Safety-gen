(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_2 ?v3 - type_2 ?v6 - type_3)
 	      (pred_3 ?v2 - object ?v6 - type_3)
	      (pred_4 ?v3 - type_2 ?v1 - type_1)
	      (pred_1 ?v3 - type_2 ?v2 - object ?v1 - type_1))

   (:action op_1
       :parameters  (?v3 - type_2 ?v5 ?v8 - type_3)
       :precondition (and  (pred_2 ?v3 ?v5))
       :effect (and  (pred_2 ?v3 ?v8)
		     (not (pred_2 ?v3 ?v5))))

   (:action op_3
       :parameters (?v3 - type_2 ?v7 - object ?v4 - type_3 ?v1 - type_1)
       :precondition  (and  (pred_3 ?v7 ?v4) (pred_2 ?v3 ?v4) (pred_4 ?v3 ?v1))
       :effect (and (pred_1 ?v3 ?v7 ?v1)
		    (not (pred_3 ?v7 ?v4)) 
		    (not (pred_4 ?v3 ?v1))))

   (:action op_2
       :parameters (?v3 - type_2 ?v7 - object ?v4 - type_3 ?v1 - type_1)
       :precondition  (and  (pred_1 ?v3 ?v7 ?v1) (pred_2 ?v3 ?v4))
       :effect (and (pred_3 ?v7 ?v4)
		    (pred_4 ?v3 ?v1)
		    (not (pred_1 ?v3 ?v7 ?v1)))))