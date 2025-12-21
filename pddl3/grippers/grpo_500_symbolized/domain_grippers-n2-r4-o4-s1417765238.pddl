(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_2 ?v1 - type_1 ?v3 - type_3)
 	      (pred_1 ?v2 - object ?v3 - type_3)
	      (pred_3 ?v1 - type_1 ?v5 - type_2)
	      (pred_4 ?v1 - type_1 ?v2 - object ?v5 - type_2))

   (:action op_3
       :parameters  (?v1 - type_1 ?v8 ?v4 - type_3)
       :precondition (and  (pred_2 ?v1 ?v8))
       :effect (and  (pred_2 ?v1 ?v4)
		     (not (pred_2 ?v1 ?v8))))

   (:action op_1
       :parameters (?v1 - type_1 ?v7 - object ?v6 - type_3 ?v5 - type_2)
       :precondition  (and  (pred_1 ?v7 ?v6) (pred_2 ?v1 ?v6) (pred_3 ?v1 ?v5))
       :effect (and (pred_4 ?v1 ?v7 ?v5)
		    (not (pred_1 ?v7 ?v6)) 
		    (not (pred_3 ?v1 ?v5))))

   (:action op_2
       :parameters (?v1 - type_1 ?v7 - object ?v6 - type_3 ?v5 - type_2)
       :precondition  (and  (pred_4 ?v1 ?v7 ?v5) (pred_2 ?v1 ?v6))
       :effect (and (pred_1 ?v7 ?v6)
		    (pred_3 ?v1 ?v5)
		    (not (pred_4 ?v1 ?v7 ?v5)))))