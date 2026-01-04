(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_4 ?v4 - type_3 ?v3 - type_1)
 	      (pred_3 ?v8 - object ?v3 - type_1)
	      (pred_2 ?v4 - type_3 ?v5 - type_2)
	      (pred_1 ?v4 - type_3 ?v8 - object ?v5 - type_2))

   (:action op_1
       :parameters  (?v4 - type_3 ?v1 ?v2 - type_1)
       :precondition (and  (pred_4 ?v4 ?v1))
       :effect (and  (pred_4 ?v4 ?v2)
		     (not (pred_4 ?v4 ?v1))))

   (:action op_2
       :parameters (?v4 - type_3 ?v7 - object ?v6 - type_1 ?v5 - type_2)
       :precondition  (and  (pred_3 ?v7 ?v6) (pred_4 ?v4 ?v6) (pred_2 ?v4 ?v5))
       :effect (and (pred_1 ?v4 ?v7 ?v5)
		    (not (pred_3 ?v7 ?v6)) 
		    (not (pred_2 ?v4 ?v5))))

   (:action op_3
       :parameters (?v4 - type_3 ?v7 - object ?v6 - type_1 ?v5 - type_2)
       :precondition  (and  (pred_1 ?v4 ?v7 ?v5) (pred_4 ?v4 ?v6))
       :effect (and (pred_3 ?v7 ?v6)
		    (pred_2 ?v4 ?v5)
		    (not (pred_1 ?v4 ?v7 ?v5)))))