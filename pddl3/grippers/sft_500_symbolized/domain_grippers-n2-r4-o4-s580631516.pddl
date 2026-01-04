(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_4 ?v5 - type_3 ?v2 - type_1)
 	      (pred_2 ?v3 - object ?v2 - type_1)
	      (pred_3 ?v5 - type_3 ?v1 - type_2)
	      (pred_1 ?v5 - type_3 ?v3 - object ?v1 - type_2))

   (:action op_1
       :parameters  (?v5 - type_3 ?v4 ?v6 - type_1)
       :precondition (and  (pred_4 ?v5 ?v4))
       :effect (and  (pred_4 ?v5 ?v6)
		     (not (pred_4 ?v5 ?v4))))

   (:action op_2
       :parameters (?v5 - type_3 ?v7 - object ?v8 - type_1 ?v1 - type_2)
       :precondition  (and  (pred_2 ?v7 ?v8) (pred_4 ?v5 ?v8) (pred_3 ?v5 ?v1))
       :effect (and (pred_1 ?v5 ?v7 ?v1)
		    (not (pred_2 ?v7 ?v8)) 
		    (not (pred_3 ?v5 ?v1))))

   (:action op_3
       :parameters (?v5 - type_3 ?v7 - object ?v8 - type_1 ?v1 - type_2)
       :precondition  (and  (pred_1 ?v5 ?v7 ?v1) (pred_4 ?v5 ?v8))
       :effect (and (pred_2 ?v7 ?v8)
		    (pred_3 ?v5 ?v1)
		    (not (pred_1 ?v5 ?v7 ?v1)))))