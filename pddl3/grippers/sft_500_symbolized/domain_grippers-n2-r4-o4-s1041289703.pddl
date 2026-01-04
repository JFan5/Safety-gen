(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_1 ?v4 - type_1 ?v6 - type_2)
 	      (pred_3 ?v7 - object ?v6 - type_2)
	      (pred_4 ?v4 - type_1 ?v2 - type_3)
	      (pred_2 ?v4 - type_1 ?v7 - object ?v2 - type_3))

   (:action op_1
       :parameters  (?v4 - type_1 ?v3 ?v8 - type_2)
       :precondition (and  (pred_1 ?v4 ?v3))
       :effect (and  (pred_1 ?v4 ?v8)
		     (not (pred_1 ?v4 ?v3))))

   (:action op_2
       :parameters (?v4 - type_1 ?v1 - object ?v5 - type_2 ?v2 - type_3)
       :precondition  (and  (pred_3 ?v1 ?v5) (pred_1 ?v4 ?v5) (pred_4 ?v4 ?v2))
       :effect (and (pred_2 ?v4 ?v1 ?v2)
		    (not (pred_3 ?v1 ?v5)) 
		    (not (pred_4 ?v4 ?v2))))

   (:action op_3
       :parameters (?v4 - type_1 ?v1 - object ?v5 - type_2 ?v2 - type_3)
       :precondition  (and  (pred_2 ?v4 ?v1 ?v2) (pred_1 ?v4 ?v5))
       :effect (and (pred_3 ?v1 ?v5)
		    (pred_4 ?v4 ?v2)
		    (not (pred_2 ?v4 ?v1 ?v2)))))