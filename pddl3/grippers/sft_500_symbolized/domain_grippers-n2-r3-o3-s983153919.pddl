(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_4 ?v5 - type_2 ?v8 - type_3)
 	      (pred_3 ?v2 - object ?v8 - type_3)
	      (pred_2 ?v5 - type_2 ?v1 - type_1)
	      (pred_1 ?v5 - type_2 ?v2 - object ?v1 - type_1))

   (:action op_1
       :parameters  (?v5 - type_2 ?v3 ?v6 - type_3)
       :precondition (and  (pred_4 ?v5 ?v3))
       :effect (and  (pred_4 ?v5 ?v6)
		     (not (pred_4 ?v5 ?v3))))

   (:action op_2
       :parameters (?v5 - type_2 ?v4 - object ?v7 - type_3 ?v1 - type_1)
       :precondition  (and  (pred_3 ?v4 ?v7) (pred_4 ?v5 ?v7) (pred_2 ?v5 ?v1))
       :effect (and (pred_1 ?v5 ?v4 ?v1)
		    (not (pred_3 ?v4 ?v7)) 
		    (not (pred_2 ?v5 ?v1))))

   (:action op_3
       :parameters (?v5 - type_2 ?v4 - object ?v7 - type_3 ?v1 - type_1)
       :precondition  (and  (pred_1 ?v5 ?v4 ?v1) (pred_4 ?v5 ?v7))
       :effect (and (pred_3 ?v4 ?v7)
		    (pred_2 ?v5 ?v1)
		    (not (pred_1 ?v5 ?v4 ?v1)))))