(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_1 ?v7 - type_3 ?v8 - type_2)
 	      (pred_4 ?v1 - object ?v8 - type_2)
	      (pred_2 ?v7 - type_3 ?v3 - type_1)
	      (pred_3 ?v7 - type_3 ?v1 - object ?v3 - type_1))

   (:action op_2
       :parameters  (?v7 - type_3 ?v6 ?v4 - type_2)
       :precondition (and  (pred_1 ?v7 ?v6))
       :effect (and  (pred_1 ?v7 ?v4)
		     (not (pred_1 ?v7 ?v6))))

   (:action op_1
       :parameters (?v7 - type_3 ?v2 - object ?v5 - type_2 ?v3 - type_1)
       :precondition  (and  (pred_4 ?v2 ?v5) (pred_1 ?v7 ?v5) (pred_2 ?v7 ?v3))
       :effect (and (pred_3 ?v7 ?v2 ?v3)
		    (not (pred_4 ?v2 ?v5)) 
		    (not (pred_2 ?v7 ?v3))))

   (:action op_3
       :parameters (?v7 - type_3 ?v2 - object ?v5 - type_2 ?v3 - type_1)
       :precondition  (and  (pred_3 ?v7 ?v2 ?v3) (pred_1 ?v7 ?v5))
       :effect (and (pred_4 ?v2 ?v5)
		    (pred_2 ?v7 ?v3)
		    (not (pred_3 ?v7 ?v2 ?v3)))))