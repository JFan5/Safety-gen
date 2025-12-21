(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_3 ?v6 - type_2 ?v7 - type_1)
 	      (pred_2 ?v2 - object ?v7 - type_1)
	      (pred_4 ?v6 - type_2 ?v5 - type_3)
	      (pred_1 ?v6 - type_2 ?v2 - object ?v5 - type_3))

   (:action op_3
       :parameters  (?v6 - type_2 ?v1 ?v8 - type_1)
       :precondition (and  (pred_3 ?v6 ?v1))
       :effect (and  (pred_3 ?v6 ?v8)
		     (not (pred_3 ?v6 ?v1))))

   (:action op_1
       :parameters (?v6 - type_2 ?v4 - object ?v3 - type_1 ?v5 - type_3)
       :precondition  (and  (pred_2 ?v4 ?v3) (pred_3 ?v6 ?v3) (pred_4 ?v6 ?v5))
       :effect (and (pred_1 ?v6 ?v4 ?v5)
		    (not (pred_2 ?v4 ?v3)) 
		    (not (pred_4 ?v6 ?v5))))

   (:action op_2
       :parameters (?v6 - type_2 ?v4 - object ?v3 - type_1 ?v5 - type_3)
       :precondition  (and  (pred_1 ?v6 ?v4 ?v5) (pred_3 ?v6 ?v3))
       :effect (and (pred_2 ?v4 ?v3)
		    (pred_4 ?v6 ?v5)
		    (not (pred_1 ?v6 ?v4 ?v5)))))