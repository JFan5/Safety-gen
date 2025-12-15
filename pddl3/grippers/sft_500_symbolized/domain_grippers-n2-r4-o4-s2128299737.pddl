(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_4 ?v3 - type_2 ?v5 - type_1)
 	      (pred_3 ?v2 - object ?v5 - type_1)
	      (pred_1 ?v3 - type_2 ?v4 - type_3)
	      (pred_2 ?v3 - type_2 ?v2 - object ?v4 - type_3))

   (:action op_2
       :parameters  (?v3 - type_2 ?v1 ?v8 - type_1)
       :precondition (and  (pred_4 ?v3 ?v1))
       :effect (and  (pred_4 ?v3 ?v8)
		     (not (pred_4 ?v3 ?v1))))

   (:action op_3
       :parameters (?v3 - type_2 ?v6 - object ?v7 - type_1 ?v4 - type_3)
       :precondition  (and  (pred_3 ?v6 ?v7) (pred_4 ?v3 ?v7) (pred_1 ?v3 ?v4))
       :effect (and (pred_2 ?v3 ?v6 ?v4)
		    (not (pred_3 ?v6 ?v7)) 
		    (not (pred_1 ?v3 ?v4))))

   (:action op_1
       :parameters (?v3 - type_2 ?v6 - object ?v7 - type_1 ?v4 - type_3)
       :precondition  (and  (pred_2 ?v3 ?v6 ?v4) (pred_4 ?v3 ?v7))
       :effect (and (pred_3 ?v6 ?v7)
		    (pred_1 ?v3 ?v4)
		    (not (pred_2 ?v3 ?v6 ?v4)))))