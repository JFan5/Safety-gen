(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_2 ?v5 - type_1 ?v3 - type_3)
 	      (pred_4 ?v7 - object ?v3 - type_3)
	      (pred_3 ?v5 - type_1 ?v8 - type_2)
	      (pred_1 ?v5 - type_1 ?v7 - object ?v8 - type_2))

   (:action op_3
       :parameters  (?v5 - type_1 ?v2 ?v1 - type_3)
       :precondition (and  (pred_2 ?v5 ?v2))
       :effect (and  (pred_2 ?v5 ?v1)
		     (not (pred_2 ?v5 ?v2))))

   (:action op_1
       :parameters (?v5 - type_1 ?v4 - object ?v6 - type_3 ?v8 - type_2)
       :precondition  (and  (pred_4 ?v4 ?v6) (pred_2 ?v5 ?v6) (pred_3 ?v5 ?v8))
       :effect (and (pred_1 ?v5 ?v4 ?v8)
		    (not (pred_4 ?v4 ?v6)) 
		    (not (pred_3 ?v5 ?v8))))

   (:action op_2
       :parameters (?v5 - type_1 ?v4 - object ?v6 - type_3 ?v8 - type_2)
       :precondition  (and  (pred_1 ?v5 ?v4 ?v8) (pred_2 ?v5 ?v6))
       :effect (and (pred_4 ?v4 ?v6)
		    (pred_3 ?v5 ?v8)
		    (not (pred_1 ?v5 ?v4 ?v8)))))