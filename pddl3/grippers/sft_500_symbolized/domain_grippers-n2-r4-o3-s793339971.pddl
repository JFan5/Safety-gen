(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_3 ?v1 - type_1 ?v8 - type_2)
 	      (pred_2 ?v2 - object ?v8 - type_2)
	      (pred_1 ?v1 - type_1 ?v7 - type_3)
	      (pred_4 ?v1 - type_1 ?v2 - object ?v7 - type_3))

   (:action op_2
       :parameters  (?v1 - type_1 ?v5 ?v6 - type_2)
       :precondition (and  (pred_3 ?v1 ?v5))
       :effect (and  (pred_3 ?v1 ?v6)
		     (not (pred_3 ?v1 ?v5))))

   (:action op_1
       :parameters (?v1 - type_1 ?v4 - object ?v3 - type_2 ?v7 - type_3)
       :precondition  (and  (pred_2 ?v4 ?v3) (pred_3 ?v1 ?v3) (pred_1 ?v1 ?v7))
       :effect (and (pred_4 ?v1 ?v4 ?v7)
		    (not (pred_2 ?v4 ?v3)) 
		    (not (pred_1 ?v1 ?v7))))

   (:action op_3
       :parameters (?v1 - type_1 ?v4 - object ?v3 - type_2 ?v7 - type_3)
       :precondition  (and  (pred_4 ?v1 ?v4 ?v7) (pred_3 ?v1 ?v3))
       :effect (and (pred_2 ?v4 ?v3)
		    (pred_1 ?v1 ?v7)
		    (not (pred_4 ?v1 ?v4 ?v7)))))