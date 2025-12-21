(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_1 ?v3 - type_2 ?v7 - type_3)
 	      (pred_2 ?v6 - object ?v7 - type_3)
	      (pred_3 ?v3 - type_2 ?v1 - type_1)
	      (pred_4 ?v3 - type_2 ?v6 - object ?v1 - type_1))

   (:action op_3
       :parameters  (?v3 - type_2 ?v5 ?v2 - type_3)
       :precondition (and  (pred_1 ?v3 ?v5))
       :effect (and  (pred_1 ?v3 ?v2)
		     (not (pred_1 ?v3 ?v5))))

   (:action op_2
       :parameters (?v3 - type_2 ?v4 - object ?v8 - type_3 ?v1 - type_1)
       :precondition  (and  (pred_2 ?v4 ?v8) (pred_1 ?v3 ?v8) (pred_3 ?v3 ?v1))
       :effect (and (pred_4 ?v3 ?v4 ?v1)
		    (not (pred_2 ?v4 ?v8)) 
		    (not (pred_3 ?v3 ?v1))))

   (:action op_1
       :parameters (?v3 - type_2 ?v4 - object ?v8 - type_3 ?v1 - type_1)
       :precondition  (and  (pred_4 ?v3 ?v4 ?v1) (pred_1 ?v3 ?v8))
       :effect (and (pred_2 ?v4 ?v8)
		    (pred_3 ?v3 ?v1)
		    (not (pred_4 ?v3 ?v4 ?v1)))))