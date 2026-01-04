(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_1 ?v6 - type_2 ?v3 - type_1)
 	      (pred_2 ?v8 - object ?v3 - type_1)
	      (pred_3 ?v6 - type_2 ?v7 - type_3)
	      (pred_4 ?v6 - type_2 ?v8 - object ?v7 - type_3))

   (:action op_2
       :parameters  (?v6 - type_2 ?v4 ?v1 - type_1)
       :precondition (and  (pred_1 ?v6 ?v4))
       :effect (and  (pred_1 ?v6 ?v1)
		     (not (pred_1 ?v6 ?v4))))

   (:action op_1
       :parameters (?v6 - type_2 ?v2 - object ?v5 - type_1 ?v7 - type_3)
       :precondition  (and  (pred_2 ?v2 ?v5) (pred_1 ?v6 ?v5) (pred_3 ?v6 ?v7))
       :effect (and (pred_4 ?v6 ?v2 ?v7)
		    (not (pred_2 ?v2 ?v5)) 
		    (not (pred_3 ?v6 ?v7))))

   (:action op_3
       :parameters (?v6 - type_2 ?v2 - object ?v5 - type_1 ?v7 - type_3)
       :precondition  (and  (pred_4 ?v6 ?v2 ?v7) (pred_1 ?v6 ?v5))
       :effect (and (pred_2 ?v2 ?v5)
		    (pred_3 ?v6 ?v7)
		    (not (pred_4 ?v6 ?v2 ?v7)))))