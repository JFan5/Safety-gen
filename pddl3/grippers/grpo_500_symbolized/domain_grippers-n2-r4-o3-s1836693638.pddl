(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_4 ?v7 - type_1 ?v2 - type_3)
 	      (pred_3 ?v8 - object ?v2 - type_3)
	      (pred_2 ?v7 - type_1 ?v3 - type_2)
	      (pred_1 ?v7 - type_1 ?v8 - object ?v3 - type_2))

   (:action op_2
       :parameters  (?v7 - type_1 ?v4 ?v1 - type_3)
       :precondition (and  (pred_4 ?v7 ?v4))
       :effect (and  (pred_4 ?v7 ?v1)
		     (not (pred_4 ?v7 ?v4))))

   (:action op_1
       :parameters (?v7 - type_1 ?v6 - object ?v5 - type_3 ?v3 - type_2)
       :precondition  (and  (pred_3 ?v6 ?v5) (pred_4 ?v7 ?v5) (pred_2 ?v7 ?v3))
       :effect (and (pred_1 ?v7 ?v6 ?v3)
		    (not (pred_3 ?v6 ?v5)) 
		    (not (pred_2 ?v7 ?v3))))

   (:action op_3
       :parameters (?v7 - type_1 ?v6 - object ?v5 - type_3 ?v3 - type_2)
       :precondition  (and  (pred_1 ?v7 ?v6 ?v3) (pred_4 ?v7 ?v5))
       :effect (and (pred_3 ?v6 ?v5)
		    (pred_2 ?v7 ?v3)
		    (not (pred_1 ?v7 ?v6 ?v3)))))