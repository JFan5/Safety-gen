(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_2 ?v1 - type_2 ?v6 - type_3)
 	      (pred_1 ?v2 - object ?v6 - type_3)
	      (pred_4 ?v1 - type_2 ?v5 - type_1)
	      (pred_3 ?v1 - type_2 ?v2 - object ?v5 - type_1))

   (:action op_3
       :parameters  (?v1 - type_2 ?v8 ?v4 - type_3)
       :precondition (and  (pred_2 ?v1 ?v8))
       :effect (and  (pred_2 ?v1 ?v4)
		     (not (pred_2 ?v1 ?v8))))

   (:action op_1
       :parameters (?v1 - type_2 ?v3 - object ?v7 - type_3 ?v5 - type_1)
       :precondition  (and  (pred_1 ?v3 ?v7) (pred_2 ?v1 ?v7) (pred_4 ?v1 ?v5))
       :effect (and (pred_3 ?v1 ?v3 ?v5)
		    (not (pred_1 ?v3 ?v7)) 
		    (not (pred_4 ?v1 ?v5))))

   (:action op_2
       :parameters (?v1 - type_2 ?v3 - object ?v7 - type_3 ?v5 - type_1)
       :precondition  (and  (pred_3 ?v1 ?v3 ?v5) (pred_2 ?v1 ?v7))
       :effect (and (pred_1 ?v3 ?v7)
		    (pred_4 ?v1 ?v5)
		    (not (pred_3 ?v1 ?v3 ?v5)))))