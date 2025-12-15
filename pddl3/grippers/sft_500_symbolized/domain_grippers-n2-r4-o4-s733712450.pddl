(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_4 ?v4 - type_1 ?v5 - type_3)
 	      (pred_3 ?v1 - object ?v5 - type_3)
	      (pred_1 ?v4 - type_1 ?v8 - type_2)
	      (pred_2 ?v4 - type_1 ?v1 - object ?v8 - type_2))

   (:action op_1
       :parameters  (?v4 - type_1 ?v3 ?v2 - type_3)
       :precondition (and  (pred_4 ?v4 ?v3))
       :effect (and  (pred_4 ?v4 ?v2)
		     (not (pred_4 ?v4 ?v3))))

   (:action op_3
       :parameters (?v4 - type_1 ?v7 - object ?v6 - type_3 ?v8 - type_2)
       :precondition  (and  (pred_3 ?v7 ?v6) (pred_4 ?v4 ?v6) (pred_1 ?v4 ?v8))
       :effect (and (pred_2 ?v4 ?v7 ?v8)
		    (not (pred_3 ?v7 ?v6)) 
		    (not (pred_1 ?v4 ?v8))))

   (:action op_2
       :parameters (?v4 - type_1 ?v7 - object ?v6 - type_3 ?v8 - type_2)
       :precondition  (and  (pred_2 ?v4 ?v7 ?v8) (pred_4 ?v4 ?v6))
       :effect (and (pred_3 ?v7 ?v6)
		    (pred_1 ?v4 ?v8)
		    (not (pred_2 ?v4 ?v7 ?v8)))))