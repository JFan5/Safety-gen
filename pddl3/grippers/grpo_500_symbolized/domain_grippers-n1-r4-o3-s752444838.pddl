(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_4 ?v8 - type_3 ?v7 - type_1)
 	      (pred_2 ?v5 - object ?v7 - type_1)
	      (pred_3 ?v8 - type_3 ?v1 - type_2)
	      (pred_1 ?v8 - type_3 ?v5 - object ?v1 - type_2))

   (:action op_3
       :parameters  (?v8 - type_3 ?v6 ?v4 - type_1)
       :precondition (and  (pred_4 ?v8 ?v6))
       :effect (and  (pred_4 ?v8 ?v4)
		     (not (pred_4 ?v8 ?v6))))

   (:action op_1
       :parameters (?v8 - type_3 ?v2 - object ?v3 - type_1 ?v1 - type_2)
       :precondition  (and  (pred_2 ?v2 ?v3) (pred_4 ?v8 ?v3) (pred_3 ?v8 ?v1))
       :effect (and (pred_1 ?v8 ?v2 ?v1)
		    (not (pred_2 ?v2 ?v3)) 
		    (not (pred_3 ?v8 ?v1))))

   (:action op_2
       :parameters (?v8 - type_3 ?v2 - object ?v3 - type_1 ?v1 - type_2)
       :precondition  (and  (pred_1 ?v8 ?v2 ?v1) (pred_4 ?v8 ?v3))
       :effect (and (pred_2 ?v2 ?v3)
		    (pred_3 ?v8 ?v1)
		    (not (pred_1 ?v8 ?v2 ?v1)))))