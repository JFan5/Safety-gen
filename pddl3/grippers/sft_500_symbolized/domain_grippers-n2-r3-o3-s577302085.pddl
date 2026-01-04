(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_3 ?v4 - type_3 ?v5 - type_1)
 	      (pred_4 ?v8 - object ?v5 - type_1)
	      (pred_2 ?v4 - type_3 ?v6 - type_2)
	      (pred_1 ?v4 - type_3 ?v8 - object ?v6 - type_2))

   (:action op_2
       :parameters  (?v4 - type_3 ?v1 ?v2 - type_1)
       :precondition (and  (pred_3 ?v4 ?v1))
       :effect (and  (pred_3 ?v4 ?v2)
		     (not (pred_3 ?v4 ?v1))))

   (:action op_3
       :parameters (?v4 - type_3 ?v7 - object ?v3 - type_1 ?v6 - type_2)
       :precondition  (and  (pred_4 ?v7 ?v3) (pred_3 ?v4 ?v3) (pred_2 ?v4 ?v6))
       :effect (and (pred_1 ?v4 ?v7 ?v6)
		    (not (pred_4 ?v7 ?v3)) 
		    (not (pred_2 ?v4 ?v6))))

   (:action op_1
       :parameters (?v4 - type_3 ?v7 - object ?v3 - type_1 ?v6 - type_2)
       :precondition  (and  (pred_1 ?v4 ?v7 ?v6) (pred_3 ?v4 ?v3))
       :effect (and (pred_4 ?v7 ?v3)
		    (pred_2 ?v4 ?v6)
		    (not (pred_1 ?v4 ?v7 ?v6)))))