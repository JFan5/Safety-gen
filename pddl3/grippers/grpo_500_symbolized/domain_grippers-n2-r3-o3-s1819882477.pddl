(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_2 ?v2 - type_3 ?v7 - type_1)
 	      (pred_1 ?v1 - object ?v7 - type_1)
	      (pred_4 ?v2 - type_3 ?v5 - type_2)
	      (pred_3 ?v2 - type_3 ?v1 - object ?v5 - type_2))

   (:action op_1
       :parameters  (?v2 - type_3 ?v8 ?v6 - type_1)
       :precondition (and  (pred_2 ?v2 ?v8))
       :effect (and  (pred_2 ?v2 ?v6)
		     (not (pred_2 ?v2 ?v8))))

   (:action op_3
       :parameters (?v2 - type_3 ?v4 - object ?v3 - type_1 ?v5 - type_2)
       :precondition  (and  (pred_1 ?v4 ?v3) (pred_2 ?v2 ?v3) (pred_4 ?v2 ?v5))
       :effect (and (pred_3 ?v2 ?v4 ?v5)
		    (not (pred_1 ?v4 ?v3)) 
		    (not (pred_4 ?v2 ?v5))))

   (:action op_2
       :parameters (?v2 - type_3 ?v4 - object ?v3 - type_1 ?v5 - type_2)
       :precondition  (and  (pred_3 ?v2 ?v4 ?v5) (pred_2 ?v2 ?v3))
       :effect (and (pred_1 ?v4 ?v3)
		    (pred_4 ?v2 ?v5)
		    (not (pred_3 ?v2 ?v4 ?v5)))))