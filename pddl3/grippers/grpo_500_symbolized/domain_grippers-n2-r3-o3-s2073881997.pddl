(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_1 ?v1 - type_2 ?v4 - type_3)
 	      (pred_4 ?v3 - object ?v4 - type_3)
	      (pred_2 ?v1 - type_2 ?v2 - type_1)
	      (pred_3 ?v1 - type_2 ?v3 - object ?v2 - type_1))

   (:action op_3
       :parameters  (?v1 - type_2 ?v8 ?v6 - type_3)
       :precondition (and  (pred_1 ?v1 ?v8))
       :effect (and  (pred_1 ?v1 ?v6)
		     (not (pred_1 ?v1 ?v8))))

   (:action op_2
       :parameters (?v1 - type_2 ?v5 - object ?v7 - type_3 ?v2 - type_1)
       :precondition  (and  (pred_4 ?v5 ?v7) (pred_1 ?v1 ?v7) (pred_2 ?v1 ?v2))
       :effect (and (pred_3 ?v1 ?v5 ?v2)
		    (not (pred_4 ?v5 ?v7)) 
		    (not (pred_2 ?v1 ?v2))))

   (:action op_1
       :parameters (?v1 - type_2 ?v5 - object ?v7 - type_3 ?v2 - type_1)
       :precondition  (and  (pred_3 ?v1 ?v5 ?v2) (pred_1 ?v1 ?v7))
       :effect (and (pred_4 ?v5 ?v7)
		    (pred_2 ?v1 ?v2)
		    (not (pred_3 ?v1 ?v5 ?v2)))))