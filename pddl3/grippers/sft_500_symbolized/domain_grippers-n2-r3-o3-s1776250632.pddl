(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_3 ?v1 - type_3 ?v6 - type_1)
 	      (pred_2 ?v7 - object ?v6 - type_1)
	      (pred_1 ?v1 - type_3 ?v2 - type_2)
	      (pred_4 ?v1 - type_3 ?v7 - object ?v2 - type_2))

   (:action op_2
       :parameters  (?v1 - type_3 ?v4 ?v8 - type_1)
       :precondition (and  (pred_3 ?v1 ?v4))
       :effect (and  (pred_3 ?v1 ?v8)
		     (not (pred_3 ?v1 ?v4))))

   (:action op_1
       :parameters (?v1 - type_3 ?v3 - object ?v5 - type_1 ?v2 - type_2)
       :precondition  (and  (pred_2 ?v3 ?v5) (pred_3 ?v1 ?v5) (pred_1 ?v1 ?v2))
       :effect (and (pred_4 ?v1 ?v3 ?v2)
		    (not (pred_2 ?v3 ?v5)) 
		    (not (pred_1 ?v1 ?v2))))

   (:action op_3
       :parameters (?v1 - type_3 ?v3 - object ?v5 - type_1 ?v2 - type_2)
       :precondition  (and  (pred_4 ?v1 ?v3 ?v2) (pred_3 ?v1 ?v5))
       :effect (and (pred_2 ?v3 ?v5)
		    (pred_1 ?v1 ?v2)
		    (not (pred_4 ?v1 ?v3 ?v2)))))