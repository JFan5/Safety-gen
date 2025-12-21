(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_1 ?v4 - type_2 ?v3 - type_1)
 	      (pred_4 ?v7 - object ?v3 - type_1)
	      (pred_2 ?v4 - type_2 ?v8 - type_3)
	      (pred_3 ?v4 - type_2 ?v7 - object ?v8 - type_3))

   (:action op_1
       :parameters  (?v4 - type_2 ?v6 ?v1 - type_1)
       :precondition (and  (pred_1 ?v4 ?v6))
       :effect (and  (pred_1 ?v4 ?v1)
		     (not (pred_1 ?v4 ?v6))))

   (:action op_3
       :parameters (?v4 - type_2 ?v5 - object ?v2 - type_1 ?v8 - type_3)
       :precondition  (and  (pred_4 ?v5 ?v2) (pred_1 ?v4 ?v2) (pred_2 ?v4 ?v8))
       :effect (and (pred_3 ?v4 ?v5 ?v8)
		    (not (pred_4 ?v5 ?v2)) 
		    (not (pred_2 ?v4 ?v8))))

   (:action op_2
       :parameters (?v4 - type_2 ?v5 - object ?v2 - type_1 ?v8 - type_3)
       :precondition  (and  (pred_3 ?v4 ?v5 ?v8) (pred_1 ?v4 ?v2))
       :effect (and (pred_4 ?v5 ?v2)
		    (pred_2 ?v4 ?v8)
		    (not (pred_3 ?v4 ?v5 ?v8)))))