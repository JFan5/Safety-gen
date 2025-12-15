(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_1 ?v7 - type_1 ?v1 - type_2)
 	      (pred_3 ?v4 - object ?v1 - type_2)
	      (pred_2 ?v7 - type_1 ?v8 - type_3)
	      (pred_4 ?v7 - type_1 ?v4 - object ?v8 - type_3))

   (:action op_1
       :parameters  (?v7 - type_1 ?v5 ?v3 - type_2)
       :precondition (and  (pred_1 ?v7 ?v5))
       :effect (and  (pred_1 ?v7 ?v3)
		     (not (pred_1 ?v7 ?v5))))

   (:action op_2
       :parameters (?v7 - type_1 ?v2 - object ?v6 - type_2 ?v8 - type_3)
       :precondition  (and  (pred_3 ?v2 ?v6) (pred_1 ?v7 ?v6) (pred_2 ?v7 ?v8))
       :effect (and (pred_4 ?v7 ?v2 ?v8)
		    (not (pred_3 ?v2 ?v6)) 
		    (not (pred_2 ?v7 ?v8))))

   (:action op_3
       :parameters (?v7 - type_1 ?v2 - object ?v6 - type_2 ?v8 - type_3)
       :precondition  (and  (pred_4 ?v7 ?v2 ?v8) (pred_1 ?v7 ?v6))
       :effect (and (pred_3 ?v2 ?v6)
		    (pred_2 ?v7 ?v8)
		    (not (pred_4 ?v7 ?v2 ?v8)))))