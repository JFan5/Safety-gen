(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_2 ?v4 - type_1 ?v6 - type_2)
 	      (pred_3 ?v2 - object ?v6 - type_2)
	      (pred_1 ?v4 - type_1 ?v5 - type_3)
	      (pred_4 ?v4 - type_1 ?v2 - object ?v5 - type_3))

   (:action op_2
       :parameters  (?v4 - type_1 ?v3 ?v1 - type_2)
       :precondition (and  (pred_2 ?v4 ?v3))
       :effect (and  (pred_2 ?v4 ?v1)
		     (not (pred_2 ?v4 ?v3))))

   (:action op_3
       :parameters (?v4 - type_1 ?v8 - object ?v7 - type_2 ?v5 - type_3)
       :precondition  (and  (pred_3 ?v8 ?v7) (pred_2 ?v4 ?v7) (pred_1 ?v4 ?v5))
       :effect (and (pred_4 ?v4 ?v8 ?v5)
		    (not (pred_3 ?v8 ?v7)) 
		    (not (pred_1 ?v4 ?v5))))

   (:action op_1
       :parameters (?v4 - type_1 ?v8 - object ?v7 - type_2 ?v5 - type_3)
       :precondition  (and  (pred_4 ?v4 ?v8 ?v5) (pred_2 ?v4 ?v7))
       :effect (and (pred_3 ?v8 ?v7)
		    (pred_1 ?v4 ?v5)
		    (not (pred_4 ?v4 ?v8 ?v5)))))