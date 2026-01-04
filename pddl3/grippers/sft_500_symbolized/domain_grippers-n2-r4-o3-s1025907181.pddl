(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_4 ?v4 - type_3 ?v8 - type_2)
 	      (pred_2 ?v6 - object ?v8 - type_2)
	      (pred_1 ?v4 - type_3 ?v2 - type_1)
	      (pred_3 ?v4 - type_3 ?v6 - object ?v2 - type_1))

   (:action op_1
       :parameters  (?v4 - type_3 ?v3 ?v7 - type_2)
       :precondition (and  (pred_4 ?v4 ?v3))
       :effect (and  (pred_4 ?v4 ?v7)
		     (not (pred_4 ?v4 ?v3))))

   (:action op_2
       :parameters (?v4 - type_3 ?v1 - object ?v5 - type_2 ?v2 - type_1)
       :precondition  (and  (pred_2 ?v1 ?v5) (pred_4 ?v4 ?v5) (pred_1 ?v4 ?v2))
       :effect (and (pred_3 ?v4 ?v1 ?v2)
		    (not (pred_2 ?v1 ?v5)) 
		    (not (pred_1 ?v4 ?v2))))

   (:action op_3
       :parameters (?v4 - type_3 ?v1 - object ?v5 - type_2 ?v2 - type_1)
       :precondition  (and  (pred_3 ?v4 ?v1 ?v2) (pred_4 ?v4 ?v5))
       :effect (and (pred_2 ?v1 ?v5)
		    (pred_1 ?v4 ?v2)
		    (not (pred_3 ?v4 ?v1 ?v2)))))