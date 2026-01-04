(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_4 ?v8 - type_2 ?v2 - type_3)
 	      (pred_2 ?v4 - object ?v2 - type_3)
	      (pred_1 ?v8 - type_2 ?v1 - type_1)
	      (pred_3 ?v8 - type_2 ?v4 - object ?v1 - type_1))

   (:action op_2
       :parameters  (?v8 - type_2 ?v5 ?v7 - type_3)
       :precondition (and  (pred_4 ?v8 ?v5))
       :effect (and  (pred_4 ?v8 ?v7)
		     (not (pred_4 ?v8 ?v5))))

   (:action op_3
       :parameters (?v8 - type_2 ?v3 - object ?v6 - type_3 ?v1 - type_1)
       :precondition  (and  (pred_2 ?v3 ?v6) (pred_4 ?v8 ?v6) (pred_1 ?v8 ?v1))
       :effect (and (pred_3 ?v8 ?v3 ?v1)
		    (not (pred_2 ?v3 ?v6)) 
		    (not (pred_1 ?v8 ?v1))))

   (:action op_1
       :parameters (?v8 - type_2 ?v3 - object ?v6 - type_3 ?v1 - type_1)
       :precondition  (and  (pred_3 ?v8 ?v3 ?v1) (pred_4 ?v8 ?v6))
       :effect (and (pred_2 ?v3 ?v6)
		    (pred_1 ?v8 ?v1)
		    (not (pred_3 ?v8 ?v3 ?v1)))))