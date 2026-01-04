(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_2 ?v7 - type_3 ?v2 - type_2)
 	      (pred_3 ?v8 - object ?v2 - type_2)
	      (pred_1 ?v7 - type_3 ?v1 - type_1)
	      (pred_4 ?v7 - type_3 ?v8 - object ?v1 - type_1))

   (:action op_1
       :parameters  (?v7 - type_3 ?v3 ?v5 - type_2)
       :precondition (and  (pred_2 ?v7 ?v3))
       :effect (and  (pred_2 ?v7 ?v5)
		     (not (pred_2 ?v7 ?v3))))

   (:action op_3
       :parameters (?v7 - type_3 ?v4 - object ?v6 - type_2 ?v1 - type_1)
       :precondition  (and  (pred_3 ?v4 ?v6) (pred_2 ?v7 ?v6) (pred_1 ?v7 ?v1))
       :effect (and (pred_4 ?v7 ?v4 ?v1)
		    (not (pred_3 ?v4 ?v6)) 
		    (not (pred_1 ?v7 ?v1))))

   (:action op_2
       :parameters (?v7 - type_3 ?v4 - object ?v6 - type_2 ?v1 - type_1)
       :precondition  (and  (pred_4 ?v7 ?v4 ?v1) (pred_2 ?v7 ?v6))
       :effect (and (pred_3 ?v4 ?v6)
		    (pred_1 ?v7 ?v1)
		    (not (pred_4 ?v7 ?v4 ?v1)))))