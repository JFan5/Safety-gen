(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_2 ?v6 - type_1 ?v2 - type_3)
 	      (pred_4 ?v8 - object ?v2 - type_3)
	      (pred_1 ?v6 - type_1 ?v1 - type_2)
	      (pred_3 ?v6 - type_1 ?v8 - object ?v1 - type_2))

   (:action op_1
       :parameters  (?v6 - type_1 ?v7 ?v3 - type_3)
       :precondition (and  (pred_2 ?v6 ?v7))
       :effect (and  (pred_2 ?v6 ?v3)
		     (not (pred_2 ?v6 ?v7))))

   (:action op_3
       :parameters (?v6 - type_1 ?v4 - object ?v5 - type_3 ?v1 - type_2)
       :precondition  (and  (pred_4 ?v4 ?v5) (pred_2 ?v6 ?v5) (pred_1 ?v6 ?v1))
       :effect (and (pred_3 ?v6 ?v4 ?v1)
		    (not (pred_4 ?v4 ?v5)) 
		    (not (pred_1 ?v6 ?v1))))

   (:action op_2
       :parameters (?v6 - type_1 ?v4 - object ?v5 - type_3 ?v1 - type_2)
       :precondition  (and  (pred_3 ?v6 ?v4 ?v1) (pred_2 ?v6 ?v5))
       :effect (and (pred_4 ?v4 ?v5)
		    (pred_1 ?v6 ?v1)
		    (not (pred_3 ?v6 ?v4 ?v1)))))