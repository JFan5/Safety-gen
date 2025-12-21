(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_4 ?v4 - type_1 ?v7 - type_3)
 	      (pred_2 ?v2 - object ?v7 - type_3)
	      (pred_3 ?v4 - type_1 ?v5 - type_2)
	      (pred_1 ?v4 - type_1 ?v2 - object ?v5 - type_2))

   (:action op_1
       :parameters  (?v4 - type_1 ?v8 ?v3 - type_3)
       :precondition (and  (pred_4 ?v4 ?v8))
       :effect (and  (pred_4 ?v4 ?v3)
		     (not (pred_4 ?v4 ?v8))))

   (:action op_3
       :parameters (?v4 - type_1 ?v1 - object ?v6 - type_3 ?v5 - type_2)
       :precondition  (and  (pred_2 ?v1 ?v6) (pred_4 ?v4 ?v6) (pred_3 ?v4 ?v5))
       :effect (and (pred_1 ?v4 ?v1 ?v5)
		    (not (pred_2 ?v1 ?v6)) 
		    (not (pred_3 ?v4 ?v5))))

   (:action op_2
       :parameters (?v4 - type_1 ?v1 - object ?v6 - type_3 ?v5 - type_2)
       :precondition  (and  (pred_1 ?v4 ?v1 ?v5) (pred_4 ?v4 ?v6))
       :effect (and (pred_2 ?v1 ?v6)
		    (pred_3 ?v4 ?v5)
		    (not (pred_1 ?v4 ?v1 ?v5)))))