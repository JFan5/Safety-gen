(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_3 ?v7 - type_1 ?v6 - type_3)
 	      (pred_1 ?v2 - object ?v6 - type_3)
	      (pred_4 ?v7 - type_1 ?v8 - type_2)
	      (pred_2 ?v7 - type_1 ?v2 - object ?v8 - type_2))

   (:action op_2
       :parameters  (?v7 - type_1 ?v1 ?v3 - type_3)
       :precondition (and  (pred_3 ?v7 ?v1))
       :effect (and  (pred_3 ?v7 ?v3)
		     (not (pred_3 ?v7 ?v1))))

   (:action op_1
       :parameters (?v7 - type_1 ?v5 - object ?v4 - type_3 ?v8 - type_2)
       :precondition  (and  (pred_1 ?v5 ?v4) (pred_3 ?v7 ?v4) (pred_4 ?v7 ?v8))
       :effect (and (pred_2 ?v7 ?v5 ?v8)
		    (not (pred_1 ?v5 ?v4)) 
		    (not (pred_4 ?v7 ?v8))))

   (:action op_3
       :parameters (?v7 - type_1 ?v5 - object ?v4 - type_3 ?v8 - type_2)
       :precondition  (and  (pred_2 ?v7 ?v5 ?v8) (pred_3 ?v7 ?v4))
       :effect (and (pred_1 ?v5 ?v4)
		    (pred_4 ?v7 ?v8)
		    (not (pred_2 ?v7 ?v5 ?v8)))))