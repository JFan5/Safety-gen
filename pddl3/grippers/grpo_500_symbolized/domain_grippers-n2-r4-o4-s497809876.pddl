(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_4 ?v3 - type_3 ?v7 - type_2)
 	      (pred_3 ?v6 - object ?v7 - type_2)
	      (pred_1 ?v3 - type_3 ?v8 - type_1)
	      (pred_2 ?v3 - type_3 ?v6 - object ?v8 - type_1))

   (:action op_3
       :parameters  (?v3 - type_3 ?v5 ?v1 - type_2)
       :precondition (and  (pred_4 ?v3 ?v5))
       :effect (and  (pred_4 ?v3 ?v1)
		     (not (pred_4 ?v3 ?v5))))

   (:action op_2
       :parameters (?v3 - type_3 ?v4 - object ?v2 - type_2 ?v8 - type_1)
       :precondition  (and  (pred_3 ?v4 ?v2) (pred_4 ?v3 ?v2) (pred_1 ?v3 ?v8))
       :effect (and (pred_2 ?v3 ?v4 ?v8)
		    (not (pred_3 ?v4 ?v2)) 
		    (not (pred_1 ?v3 ?v8))))

   (:action op_1
       :parameters (?v3 - type_3 ?v4 - object ?v2 - type_2 ?v8 - type_1)
       :precondition  (and  (pred_2 ?v3 ?v4 ?v8) (pred_4 ?v3 ?v2))
       :effect (and (pred_3 ?v4 ?v2)
		    (pred_1 ?v3 ?v8)
		    (not (pred_2 ?v3 ?v4 ?v8)))))