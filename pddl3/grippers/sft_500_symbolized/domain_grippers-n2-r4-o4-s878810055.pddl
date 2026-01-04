(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_4 ?v2 - type_1 ?v6 - type_3)
 	      (pred_1 ?v3 - object ?v6 - type_3)
	      (pred_3 ?v2 - type_1 ?v4 - type_2)
	      (pred_2 ?v2 - type_1 ?v3 - object ?v4 - type_2))

   (:action op_1
       :parameters  (?v2 - type_1 ?v8 ?v7 - type_3)
       :precondition (and  (pred_4 ?v2 ?v8))
       :effect (and  (pred_4 ?v2 ?v7)
		     (not (pred_4 ?v2 ?v8))))

   (:action op_2
       :parameters (?v2 - type_1 ?v1 - object ?v5 - type_3 ?v4 - type_2)
       :precondition  (and  (pred_1 ?v1 ?v5) (pred_4 ?v2 ?v5) (pred_3 ?v2 ?v4))
       :effect (and (pred_2 ?v2 ?v1 ?v4)
		    (not (pred_1 ?v1 ?v5)) 
		    (not (pred_3 ?v2 ?v4))))

   (:action op_3
       :parameters (?v2 - type_1 ?v1 - object ?v5 - type_3 ?v4 - type_2)
       :precondition  (and  (pred_2 ?v2 ?v1 ?v4) (pred_4 ?v2 ?v5))
       :effect (and (pred_1 ?v1 ?v5)
		    (pred_3 ?v2 ?v4)
		    (not (pred_2 ?v2 ?v1 ?v4)))))