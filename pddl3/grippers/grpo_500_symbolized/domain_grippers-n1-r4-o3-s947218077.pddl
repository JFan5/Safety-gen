(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_2 ?v2 - type_2 ?v6 - type_1)
 	      (pred_1 ?v7 - object ?v6 - type_1)
	      (pred_3 ?v2 - type_2 ?v1 - type_3)
	      (pred_4 ?v2 - type_2 ?v7 - object ?v1 - type_3))

   (:action op_2
       :parameters  (?v2 - type_2 ?v5 ?v4 - type_1)
       :precondition (and  (pred_2 ?v2 ?v5))
       :effect (and  (pred_2 ?v2 ?v4)
		     (not (pred_2 ?v2 ?v5))))

   (:action op_1
       :parameters (?v2 - type_2 ?v8 - object ?v3 - type_1 ?v1 - type_3)
       :precondition  (and  (pred_1 ?v8 ?v3) (pred_2 ?v2 ?v3) (pred_3 ?v2 ?v1))
       :effect (and (pred_4 ?v2 ?v8 ?v1)
		    (not (pred_1 ?v8 ?v3)) 
		    (not (pred_3 ?v2 ?v1))))

   (:action op_3
       :parameters (?v2 - type_2 ?v8 - object ?v3 - type_1 ?v1 - type_3)
       :precondition  (and  (pred_4 ?v2 ?v8 ?v1) (pred_2 ?v2 ?v3))
       :effect (and (pred_1 ?v8 ?v3)
		    (pred_3 ?v2 ?v1)
		    (not (pred_4 ?v2 ?v8 ?v1)))))