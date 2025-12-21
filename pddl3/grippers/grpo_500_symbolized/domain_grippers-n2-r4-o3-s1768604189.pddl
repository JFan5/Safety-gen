(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_1 ?v8 - type_1 ?v2 - type_2)
 	      (pred_2 ?v7 - object ?v2 - type_2)
	      (pred_3 ?v8 - type_1 ?v1 - type_3)
	      (pred_4 ?v8 - type_1 ?v7 - object ?v1 - type_3))

   (:action op_3
       :parameters  (?v8 - type_1 ?v6 ?v3 - type_2)
       :precondition (and  (pred_1 ?v8 ?v6))
       :effect (and  (pred_1 ?v8 ?v3)
		     (not (pred_1 ?v8 ?v6))))

   (:action op_2
       :parameters (?v8 - type_1 ?v4 - object ?v5 - type_2 ?v1 - type_3)
       :precondition  (and  (pred_2 ?v4 ?v5) (pred_1 ?v8 ?v5) (pred_3 ?v8 ?v1))
       :effect (and (pred_4 ?v8 ?v4 ?v1)
		    (not (pred_2 ?v4 ?v5)) 
		    (not (pred_3 ?v8 ?v1))))

   (:action op_1
       :parameters (?v8 - type_1 ?v4 - object ?v5 - type_2 ?v1 - type_3)
       :precondition  (and  (pred_4 ?v8 ?v4 ?v1) (pred_1 ?v8 ?v5))
       :effect (and (pred_2 ?v4 ?v5)
		    (pred_3 ?v8 ?v1)
		    (not (pred_4 ?v8 ?v4 ?v1)))))