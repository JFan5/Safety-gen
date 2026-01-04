(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_1 ?v2 - type_3 ?v3 - type_1)
 	      (pred_4 ?v7 - object ?v3 - type_1)
	      (pred_3 ?v2 - type_3 ?v5 - type_2)
	      (pred_2 ?v2 - type_3 ?v7 - object ?v5 - type_2))

   (:action op_2
       :parameters  (?v2 - type_3 ?v6 ?v1 - type_1)
       :precondition (and  (pred_1 ?v2 ?v6))
       :effect (and  (pred_1 ?v2 ?v1)
		     (not (pred_1 ?v2 ?v6))))

   (:action op_1
       :parameters (?v2 - type_3 ?v8 - object ?v4 - type_1 ?v5 - type_2)
       :precondition  (and  (pred_4 ?v8 ?v4) (pred_1 ?v2 ?v4) (pred_3 ?v2 ?v5))
       :effect (and (pred_2 ?v2 ?v8 ?v5)
		    (not (pred_4 ?v8 ?v4)) 
		    (not (pred_3 ?v2 ?v5))))

   (:action op_3
       :parameters (?v2 - type_3 ?v8 - object ?v4 - type_1 ?v5 - type_2)
       :precondition  (and  (pred_2 ?v2 ?v8 ?v5) (pred_1 ?v2 ?v4))
       :effect (and (pred_4 ?v8 ?v4)
		    (pred_3 ?v2 ?v5)
		    (not (pred_2 ?v2 ?v8 ?v5)))))