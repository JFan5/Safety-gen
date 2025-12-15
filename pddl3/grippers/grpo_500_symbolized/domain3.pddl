(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_3 ?v3 - type_1 ?v8 - type_2)
 	      (pred_2 ?v6 - object ?v8 - type_2)
	      (pred_4 ?v3 - type_1 ?v7 - type_3)
	      (pred_1 ?v3 - type_1 ?v6 - object ?v7 - type_3))

   (:action op_2
       :parameters  (?v3 - type_1 ?v5 ?v2 - type_2)
       :precondition (and  (pred_3 ?v3 ?v5))
       :effect (and  (pred_3 ?v3 ?v2)
		     (not (pred_3 ?v3 ?v5))))

   (:action op_1
       :parameters (?v3 - type_1 ?v4 - object ?v1 - type_2 ?v7 - type_3)
       :precondition  (and  (pred_2 ?v4 ?v1) (pred_3 ?v3 ?v1) (pred_4 ?v3 ?v7))
       :effect (and (pred_1 ?v3 ?v4 ?v7)
		    (not (pred_2 ?v4 ?v1)) 
		    (not (pred_4 ?v3 ?v7))))

   (:action op_3
       :parameters (?v3 - type_1 ?v4 - object ?v1 - type_2 ?v7 - type_3)
       :precondition  (and  (pred_1 ?v3 ?v4 ?v7) (pred_3 ?v3 ?v1))
       :effect (and (pred_2 ?v4 ?v1)
		    (pred_4 ?v3 ?v7)
		    (not (pred_1 ?v3 ?v4 ?v7)))))