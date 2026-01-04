(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_2 ?v7 - type_1 ?v5 - type_3)
 	      (pred_1 ?v2 - object ?v5 - type_3)
	      (pred_3 ?v7 - type_1 ?v4 - type_2)
	      (pred_4 ?v7 - type_1 ?v2 - object ?v4 - type_2))

   (:action op_2
       :parameters  (?v7 - type_1 ?v8 ?v3 - type_3)
       :precondition (and  (pred_2 ?v7 ?v8))
       :effect (and  (pred_2 ?v7 ?v3)
		     (not (pred_2 ?v7 ?v8))))

   (:action op_1
       :parameters (?v7 - type_1 ?v1 - object ?v6 - type_3 ?v4 - type_2)
       :precondition  (and  (pred_1 ?v1 ?v6) (pred_2 ?v7 ?v6) (pred_3 ?v7 ?v4))
       :effect (and (pred_4 ?v7 ?v1 ?v4)
		    (not (pred_1 ?v1 ?v6)) 
		    (not (pred_3 ?v7 ?v4))))

   (:action op_3
       :parameters (?v7 - type_1 ?v1 - object ?v6 - type_3 ?v4 - type_2)
       :precondition  (and  (pred_4 ?v7 ?v1 ?v4) (pred_2 ?v7 ?v6))
       :effect (and (pred_1 ?v1 ?v6)
		    (pred_3 ?v7 ?v4)
		    (not (pred_4 ?v7 ?v1 ?v4)))))