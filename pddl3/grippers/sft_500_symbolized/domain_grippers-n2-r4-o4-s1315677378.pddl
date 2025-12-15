(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_2 ?v2 - type_2 ?v1 - type_1)
 	      (pred_3 ?v5 - object ?v1 - type_1)
	      (pred_1 ?v2 - type_2 ?v4 - type_3)
	      (pred_4 ?v2 - type_2 ?v5 - object ?v4 - type_3))

   (:action op_3
       :parameters  (?v2 - type_2 ?v6 ?v8 - type_1)
       :precondition (and  (pred_2 ?v2 ?v6))
       :effect (and  (pred_2 ?v2 ?v8)
		     (not (pred_2 ?v2 ?v6))))

   (:action op_2
       :parameters (?v2 - type_2 ?v3 - object ?v7 - type_1 ?v4 - type_3)
       :precondition  (and  (pred_3 ?v3 ?v7) (pred_2 ?v2 ?v7) (pred_1 ?v2 ?v4))
       :effect (and (pred_4 ?v2 ?v3 ?v4)
		    (not (pred_3 ?v3 ?v7)) 
		    (not (pred_1 ?v2 ?v4))))

   (:action op_1
       :parameters (?v2 - type_2 ?v3 - object ?v7 - type_1 ?v4 - type_3)
       :precondition  (and  (pred_4 ?v2 ?v3 ?v4) (pred_2 ?v2 ?v7))
       :effect (and (pred_3 ?v3 ?v7)
		    (pred_1 ?v2 ?v4)
		    (not (pred_4 ?v2 ?v3 ?v4)))))