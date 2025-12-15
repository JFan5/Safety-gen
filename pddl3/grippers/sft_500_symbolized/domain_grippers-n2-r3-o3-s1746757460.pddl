(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_2 ?v6 - type_2 ?v1 - type_3)
 	      (pred_4 ?v5 - object ?v1 - type_3)
	      (pred_1 ?v6 - type_2 ?v4 - type_1)
	      (pred_3 ?v6 - type_2 ?v5 - object ?v4 - type_1))

   (:action op_3
       :parameters  (?v6 - type_2 ?v8 ?v2 - type_3)
       :precondition (and  (pred_2 ?v6 ?v8))
       :effect (and  (pred_2 ?v6 ?v2)
		     (not (pred_2 ?v6 ?v8))))

   (:action op_2
       :parameters (?v6 - type_2 ?v7 - object ?v3 - type_3 ?v4 - type_1)
       :precondition  (and  (pred_4 ?v7 ?v3) (pred_2 ?v6 ?v3) (pred_1 ?v6 ?v4))
       :effect (and (pred_3 ?v6 ?v7 ?v4)
		    (not (pred_4 ?v7 ?v3)) 
		    (not (pred_1 ?v6 ?v4))))

   (:action op_1
       :parameters (?v6 - type_2 ?v7 - object ?v3 - type_3 ?v4 - type_1)
       :precondition  (and  (pred_3 ?v6 ?v7 ?v4) (pred_2 ?v6 ?v3))
       :effect (and (pred_4 ?v7 ?v3)
		    (pred_1 ?v6 ?v4)
		    (not (pred_3 ?v6 ?v7 ?v4)))))