(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_3 ?v7 - type_1 ?v4 - type_3)
 	      (pred_2 ?v5 - object ?v4 - type_3)
	      (pred_4 ?v7 - type_1 ?v1 - type_2)
	      (pred_1 ?v7 - type_1 ?v5 - object ?v1 - type_2))

   (:action op_1
       :parameters  (?v7 - type_1 ?v6 ?v2 - type_3)
       :precondition (and  (pred_3 ?v7 ?v6))
       :effect (and  (pred_3 ?v7 ?v2)
		     (not (pred_3 ?v7 ?v6))))

   (:action op_2
       :parameters (?v7 - type_1 ?v3 - object ?v8 - type_3 ?v1 - type_2)
       :precondition  (and  (pred_2 ?v3 ?v8) (pred_3 ?v7 ?v8) (pred_4 ?v7 ?v1))
       :effect (and (pred_1 ?v7 ?v3 ?v1)
		    (not (pred_2 ?v3 ?v8)) 
		    (not (pred_4 ?v7 ?v1))))

   (:action op_3
       :parameters (?v7 - type_1 ?v3 - object ?v8 - type_3 ?v1 - type_2)
       :precondition  (and  (pred_1 ?v7 ?v3 ?v1) (pred_3 ?v7 ?v8))
       :effect (and (pred_2 ?v3 ?v8)
		    (pred_4 ?v7 ?v1)
		    (not (pred_1 ?v7 ?v3 ?v1)))))