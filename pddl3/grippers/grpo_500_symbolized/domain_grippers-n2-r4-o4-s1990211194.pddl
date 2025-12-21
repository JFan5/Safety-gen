(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_4 ?v2 - type_1 ?v4 - type_3)
 	      (pred_2 ?v8 - object ?v4 - type_3)
	      (pred_3 ?v2 - type_1 ?v1 - type_2)
	      (pred_1 ?v2 - type_1 ?v8 - object ?v1 - type_2))

   (:action op_2
       :parameters  (?v2 - type_1 ?v6 ?v7 - type_3)
       :precondition (and  (pred_4 ?v2 ?v6))
       :effect (and  (pred_4 ?v2 ?v7)
		     (not (pred_4 ?v2 ?v6))))

   (:action op_1
       :parameters (?v2 - type_1 ?v5 - object ?v3 - type_3 ?v1 - type_2)
       :precondition  (and  (pred_2 ?v5 ?v3) (pred_4 ?v2 ?v3) (pred_3 ?v2 ?v1))
       :effect (and (pred_1 ?v2 ?v5 ?v1)
		    (not (pred_2 ?v5 ?v3)) 
		    (not (pred_3 ?v2 ?v1))))

   (:action op_3
       :parameters (?v2 - type_1 ?v5 - object ?v3 - type_3 ?v1 - type_2)
       :precondition  (and  (pred_1 ?v2 ?v5 ?v1) (pred_4 ?v2 ?v3))
       :effect (and (pred_2 ?v5 ?v3)
		    (pred_3 ?v2 ?v1)
		    (not (pred_1 ?v2 ?v5 ?v1)))))