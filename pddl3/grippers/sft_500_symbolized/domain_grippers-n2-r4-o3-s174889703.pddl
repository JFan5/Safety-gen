(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_3 ?v4 - type_3 ?v7 - type_2)
 	      (pred_1 ?v2 - object ?v7 - type_2)
	      (pred_4 ?v4 - type_3 ?v1 - type_1)
	      (pred_2 ?v4 - type_3 ?v2 - object ?v1 - type_1))

   (:action op_3
       :parameters  (?v4 - type_3 ?v3 ?v6 - type_2)
       :precondition (and  (pred_3 ?v4 ?v3))
       :effect (and  (pred_3 ?v4 ?v6)
		     (not (pred_3 ?v4 ?v3))))

   (:action op_1
       :parameters (?v4 - type_3 ?v5 - object ?v8 - type_2 ?v1 - type_1)
       :precondition  (and  (pred_1 ?v5 ?v8) (pred_3 ?v4 ?v8) (pred_4 ?v4 ?v1))
       :effect (and (pred_2 ?v4 ?v5 ?v1)
		    (not (pred_1 ?v5 ?v8)) 
		    (not (pred_4 ?v4 ?v1))))

   (:action op_2
       :parameters (?v4 - type_3 ?v5 - object ?v8 - type_2 ?v1 - type_1)
       :precondition  (and  (pred_2 ?v4 ?v5 ?v1) (pred_3 ?v4 ?v8))
       :effect (and (pred_1 ?v5 ?v8)
		    (pred_4 ?v4 ?v1)
		    (not (pred_2 ?v4 ?v5 ?v1)))))