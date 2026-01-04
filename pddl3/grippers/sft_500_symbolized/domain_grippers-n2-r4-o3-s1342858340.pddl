(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_3 ?v1 - type_1 ?v4 - type_3)
 	      (pred_1 ?v6 - object ?v4 - type_3)
	      (pred_4 ?v1 - type_1 ?v3 - type_2)
	      (pred_2 ?v1 - type_1 ?v6 - object ?v3 - type_2))

   (:action op_3
       :parameters  (?v1 - type_1 ?v5 ?v2 - type_3)
       :precondition (and  (pred_3 ?v1 ?v5))
       :effect (and  (pred_3 ?v1 ?v2)
		     (not (pred_3 ?v1 ?v5))))

   (:action op_2
       :parameters (?v1 - type_1 ?v7 - object ?v8 - type_3 ?v3 - type_2)
       :precondition  (and  (pred_1 ?v7 ?v8) (pred_3 ?v1 ?v8) (pred_4 ?v1 ?v3))
       :effect (and (pred_2 ?v1 ?v7 ?v3)
		    (not (pred_1 ?v7 ?v8)) 
		    (not (pred_4 ?v1 ?v3))))

   (:action op_1
       :parameters (?v1 - type_1 ?v7 - object ?v8 - type_3 ?v3 - type_2)
       :precondition  (and  (pred_2 ?v1 ?v7 ?v3) (pred_3 ?v1 ?v8))
       :effect (and (pred_1 ?v7 ?v8)
		    (pred_4 ?v1 ?v3)
		    (not (pred_2 ?v1 ?v7 ?v3)))))