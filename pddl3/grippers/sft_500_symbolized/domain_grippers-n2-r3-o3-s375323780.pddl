(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_3 ?v1 - type_2 ?v7 - type_1)
 	      (pred_2 ?v8 - object ?v7 - type_1)
	      (pred_1 ?v1 - type_2 ?v2 - type_3)
	      (pred_4 ?v1 - type_2 ?v8 - object ?v2 - type_3))

   (:action op_2
       :parameters  (?v1 - type_2 ?v5 ?v3 - type_1)
       :precondition (and  (pred_3 ?v1 ?v5))
       :effect (and  (pred_3 ?v1 ?v3)
		     (not (pred_3 ?v1 ?v5))))

   (:action op_3
       :parameters (?v1 - type_2 ?v4 - object ?v6 - type_1 ?v2 - type_3)
       :precondition  (and  (pred_2 ?v4 ?v6) (pred_3 ?v1 ?v6) (pred_1 ?v1 ?v2))
       :effect (and (pred_4 ?v1 ?v4 ?v2)
		    (not (pred_2 ?v4 ?v6)) 
		    (not (pred_1 ?v1 ?v2))))

   (:action op_1
       :parameters (?v1 - type_2 ?v4 - object ?v6 - type_1 ?v2 - type_3)
       :precondition  (and  (pred_4 ?v1 ?v4 ?v2) (pred_3 ?v1 ?v6))
       :effect (and (pred_2 ?v4 ?v6)
		    (pred_1 ?v1 ?v2)
		    (not (pred_4 ?v1 ?v4 ?v2)))))