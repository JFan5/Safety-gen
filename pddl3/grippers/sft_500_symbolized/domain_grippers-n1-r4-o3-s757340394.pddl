(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_2 ?v8 - type_1 ?v6 - type_2)
 	      (pred_1 ?v1 - object ?v6 - type_2)
	      (pred_3 ?v8 - type_1 ?v2 - type_3)
	      (pred_4 ?v8 - type_1 ?v1 - object ?v2 - type_3))

   (:action op_1
       :parameters  (?v8 - type_1 ?v4 ?v7 - type_2)
       :precondition (and  (pred_2 ?v8 ?v4))
       :effect (and  (pred_2 ?v8 ?v7)
		     (not (pred_2 ?v8 ?v4))))

   (:action op_2
       :parameters (?v8 - type_1 ?v5 - object ?v3 - type_2 ?v2 - type_3)
       :precondition  (and  (pred_1 ?v5 ?v3) (pred_2 ?v8 ?v3) (pred_3 ?v8 ?v2))
       :effect (and (pred_4 ?v8 ?v5 ?v2)
		    (not (pred_1 ?v5 ?v3)) 
		    (not (pred_3 ?v8 ?v2))))

   (:action op_3
       :parameters (?v8 - type_1 ?v5 - object ?v3 - type_2 ?v2 - type_3)
       :precondition  (and  (pred_4 ?v8 ?v5 ?v2) (pred_2 ?v8 ?v3))
       :effect (and (pred_1 ?v5 ?v3)
		    (pred_3 ?v8 ?v2)
		    (not (pred_4 ?v8 ?v5 ?v2)))))