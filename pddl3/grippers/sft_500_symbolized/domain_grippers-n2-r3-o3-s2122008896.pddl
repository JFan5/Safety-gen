(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_2 ?v3 - type_2 ?v8 - type_3)
 	      (pred_1 ?v4 - object ?v8 - type_3)
	      (pred_4 ?v3 - type_2 ?v1 - type_1)
	      (pred_3 ?v3 - type_2 ?v4 - object ?v1 - type_1))

   (:action op_1
       :parameters  (?v3 - type_2 ?v7 ?v6 - type_3)
       :precondition (and  (pred_2 ?v3 ?v7))
       :effect (and  (pred_2 ?v3 ?v6)
		     (not (pred_2 ?v3 ?v7))))

   (:action op_3
       :parameters (?v3 - type_2 ?v5 - object ?v2 - type_3 ?v1 - type_1)
       :precondition  (and  (pred_1 ?v5 ?v2) (pred_2 ?v3 ?v2) (pred_4 ?v3 ?v1))
       :effect (and (pred_3 ?v3 ?v5 ?v1)
		    (not (pred_1 ?v5 ?v2)) 
		    (not (pred_4 ?v3 ?v1))))

   (:action op_2
       :parameters (?v3 - type_2 ?v5 - object ?v2 - type_3 ?v1 - type_1)
       :precondition  (and  (pred_3 ?v3 ?v5 ?v1) (pred_2 ?v3 ?v2))
       :effect (and (pred_1 ?v5 ?v2)
		    (pred_4 ?v3 ?v1)
		    (not (pred_3 ?v3 ?v5 ?v1)))))