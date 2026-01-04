(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_4 ?v2 - type_3 ?v7 - type_2)
 	      (pred_3 ?v4 - object ?v7 - type_2)
	      (pred_2 ?v2 - type_3 ?v8 - type_1)
	      (pred_1 ?v2 - type_3 ?v4 - object ?v8 - type_1))

   (:action op_3
       :parameters  (?v2 - type_3 ?v5 ?v3 - type_2)
       :precondition (and  (pred_4 ?v2 ?v5))
       :effect (and  (pred_4 ?v2 ?v3)
		     (not (pred_4 ?v2 ?v5))))

   (:action op_1
       :parameters (?v2 - type_3 ?v1 - object ?v6 - type_2 ?v8 - type_1)
       :precondition  (and  (pred_3 ?v1 ?v6) (pred_4 ?v2 ?v6) (pred_2 ?v2 ?v8))
       :effect (and (pred_1 ?v2 ?v1 ?v8)
		    (not (pred_3 ?v1 ?v6)) 
		    (not (pred_2 ?v2 ?v8))))

   (:action op_2
       :parameters (?v2 - type_3 ?v1 - object ?v6 - type_2 ?v8 - type_1)
       :precondition  (and  (pred_1 ?v2 ?v1 ?v8) (pred_4 ?v2 ?v6))
       :effect (and (pred_3 ?v1 ?v6)
		    (pred_2 ?v2 ?v8)
		    (not (pred_1 ?v2 ?v1 ?v8)))))