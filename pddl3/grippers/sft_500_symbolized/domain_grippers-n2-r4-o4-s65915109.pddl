(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_4 ?v1 - type_3 ?v6 - type_1)
 	      (pred_1 ?v4 - object ?v6 - type_1)
	      (pred_3 ?v1 - type_3 ?v2 - type_2)
	      (pred_2 ?v1 - type_3 ?v4 - object ?v2 - type_2))

   (:action op_3
       :parameters  (?v1 - type_3 ?v8 ?v5 - type_1)
       :precondition (and  (pred_4 ?v1 ?v8))
       :effect (and  (pred_4 ?v1 ?v5)
		     (not (pred_4 ?v1 ?v8))))

   (:action op_1
       :parameters (?v1 - type_3 ?v7 - object ?v3 - type_1 ?v2 - type_2)
       :precondition  (and  (pred_1 ?v7 ?v3) (pred_4 ?v1 ?v3) (pred_3 ?v1 ?v2))
       :effect (and (pred_2 ?v1 ?v7 ?v2)
		    (not (pred_1 ?v7 ?v3)) 
		    (not (pred_3 ?v1 ?v2))))

   (:action op_2
       :parameters (?v1 - type_3 ?v7 - object ?v3 - type_1 ?v2 - type_2)
       :precondition  (and  (pred_2 ?v1 ?v7 ?v2) (pred_4 ?v1 ?v3))
       :effect (and (pred_1 ?v7 ?v3)
		    (pred_3 ?v1 ?v2)
		    (not (pred_2 ?v1 ?v7 ?v2)))))