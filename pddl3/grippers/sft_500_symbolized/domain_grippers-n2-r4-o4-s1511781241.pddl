(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_3 ?v2 - type_2 ?v4 - type_1)
 	      (pred_4 ?v3 - object ?v4 - type_1)
	      (pred_1 ?v2 - type_2 ?v6 - type_3)
	      (pred_2 ?v2 - type_2 ?v3 - object ?v6 - type_3))

   (:action op_1
       :parameters  (?v2 - type_2 ?v1 ?v8 - type_1)
       :precondition (and  (pred_3 ?v2 ?v1))
       :effect (and  (pred_3 ?v2 ?v8)
		     (not (pred_3 ?v2 ?v1))))

   (:action op_2
       :parameters (?v2 - type_2 ?v7 - object ?v5 - type_1 ?v6 - type_3)
       :precondition  (and  (pred_4 ?v7 ?v5) (pred_3 ?v2 ?v5) (pred_1 ?v2 ?v6))
       :effect (and (pred_2 ?v2 ?v7 ?v6)
		    (not (pred_4 ?v7 ?v5)) 
		    (not (pred_1 ?v2 ?v6))))

   (:action op_3
       :parameters (?v2 - type_2 ?v7 - object ?v5 - type_1 ?v6 - type_3)
       :precondition  (and  (pred_2 ?v2 ?v7 ?v6) (pred_3 ?v2 ?v5))
       :effect (and (pred_4 ?v7 ?v5)
		    (pred_1 ?v2 ?v6)
		    (not (pred_2 ?v2 ?v7 ?v6)))))