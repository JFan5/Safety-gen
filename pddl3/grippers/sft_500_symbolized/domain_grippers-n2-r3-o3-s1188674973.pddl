(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_1 ?v8 - type_1 ?v3 - type_3)
 	      (pred_3 ?v7 - object ?v3 - type_3)
	      (pred_4 ?v8 - type_1 ?v5 - type_2)
	      (pred_2 ?v8 - type_1 ?v7 - object ?v5 - type_2))

   (:action op_2
       :parameters  (?v8 - type_1 ?v1 ?v6 - type_3)
       :precondition (and  (pred_1 ?v8 ?v1))
       :effect (and  (pred_1 ?v8 ?v6)
		     (not (pred_1 ?v8 ?v1))))

   (:action op_3
       :parameters (?v8 - type_1 ?v2 - object ?v4 - type_3 ?v5 - type_2)
       :precondition  (and  (pred_3 ?v2 ?v4) (pred_1 ?v8 ?v4) (pred_4 ?v8 ?v5))
       :effect (and (pred_2 ?v8 ?v2 ?v5)
		    (not (pred_3 ?v2 ?v4)) 
		    (not (pred_4 ?v8 ?v5))))

   (:action op_1
       :parameters (?v8 - type_1 ?v2 - object ?v4 - type_3 ?v5 - type_2)
       :precondition  (and  (pred_2 ?v8 ?v2 ?v5) (pred_1 ?v8 ?v4))
       :effect (and (pred_3 ?v2 ?v4)
		    (pred_4 ?v8 ?v5)
		    (not (pred_2 ?v8 ?v2 ?v5)))))