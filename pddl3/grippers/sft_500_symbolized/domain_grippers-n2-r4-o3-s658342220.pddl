(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_4 ?v7 - type_3 ?v6 - type_2)
 	      (pred_1 ?v3 - object ?v6 - type_2)
	      (pred_3 ?v7 - type_3 ?v5 - type_1)
	      (pred_2 ?v7 - type_3 ?v3 - object ?v5 - type_1))

   (:action op_3
       :parameters  (?v7 - type_3 ?v8 ?v2 - type_2)
       :precondition (and  (pred_4 ?v7 ?v8))
       :effect (and  (pred_4 ?v7 ?v2)
		     (not (pred_4 ?v7 ?v8))))

   (:action op_1
       :parameters (?v7 - type_3 ?v4 - object ?v1 - type_2 ?v5 - type_1)
       :precondition  (and  (pred_1 ?v4 ?v1) (pred_4 ?v7 ?v1) (pred_3 ?v7 ?v5))
       :effect (and (pred_2 ?v7 ?v4 ?v5)
		    (not (pred_1 ?v4 ?v1)) 
		    (not (pred_3 ?v7 ?v5))))

   (:action op_2
       :parameters (?v7 - type_3 ?v4 - object ?v1 - type_2 ?v5 - type_1)
       :precondition  (and  (pred_2 ?v7 ?v4 ?v5) (pred_4 ?v7 ?v1))
       :effect (and (pred_1 ?v4 ?v1)
		    (pred_3 ?v7 ?v5)
		    (not (pred_2 ?v7 ?v4 ?v5)))))