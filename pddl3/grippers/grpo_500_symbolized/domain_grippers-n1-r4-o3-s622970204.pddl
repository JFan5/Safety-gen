(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_2 ?v4 - type_2 ?v6 - type_1)
 	      (pred_4 ?v3 - object ?v6 - type_1)
	      (pred_3 ?v4 - type_2 ?v7 - type_3)
	      (pred_1 ?v4 - type_2 ?v3 - object ?v7 - type_3))

   (:action op_1
       :parameters  (?v4 - type_2 ?v8 ?v5 - type_1)
       :precondition (and  (pred_2 ?v4 ?v8))
       :effect (and  (pred_2 ?v4 ?v5)
		     (not (pred_2 ?v4 ?v8))))

   (:action op_2
       :parameters (?v4 - type_2 ?v2 - object ?v1 - type_1 ?v7 - type_3)
       :precondition  (and  (pred_4 ?v2 ?v1) (pred_2 ?v4 ?v1) (pred_3 ?v4 ?v7))
       :effect (and (pred_1 ?v4 ?v2 ?v7)
		    (not (pred_4 ?v2 ?v1)) 
		    (not (pred_3 ?v4 ?v7))))

   (:action op_3
       :parameters (?v4 - type_2 ?v2 - object ?v1 - type_1 ?v7 - type_3)
       :precondition  (and  (pred_1 ?v4 ?v2 ?v7) (pred_2 ?v4 ?v1))
       :effect (and (pred_4 ?v2 ?v1)
		    (pred_3 ?v4 ?v7)
		    (not (pred_1 ?v4 ?v2 ?v7)))))