(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_3 ?v7 - type_3 ?v8 - type_1)
 	      (pred_2 ?v3 - object ?v8 - type_1)
	      (pred_4 ?v7 - type_3 ?v1 - type_2)
	      (pred_1 ?v7 - type_3 ?v3 - object ?v1 - type_2))

   (:action op_2
       :parameters  (?v7 - type_3 ?v4 ?v2 - type_1)
       :precondition (and  (pred_3 ?v7 ?v4))
       :effect (and  (pred_3 ?v7 ?v2)
		     (not (pred_3 ?v7 ?v4))))

   (:action op_3
       :parameters (?v7 - type_3 ?v5 - object ?v6 - type_1 ?v1 - type_2)
       :precondition  (and  (pred_2 ?v5 ?v6) (pred_3 ?v7 ?v6) (pred_4 ?v7 ?v1))
       :effect (and (pred_1 ?v7 ?v5 ?v1)
		    (not (pred_2 ?v5 ?v6)) 
		    (not (pred_4 ?v7 ?v1))))

   (:action op_1
       :parameters (?v7 - type_3 ?v5 - object ?v6 - type_1 ?v1 - type_2)
       :precondition  (and  (pred_1 ?v7 ?v5 ?v1) (pred_3 ?v7 ?v6))
       :effect (and (pred_2 ?v5 ?v6)
		    (pred_4 ?v7 ?v1)
		    (not (pred_1 ?v7 ?v5 ?v1)))))