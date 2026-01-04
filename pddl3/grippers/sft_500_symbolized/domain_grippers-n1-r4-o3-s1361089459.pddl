(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_4 ?v8 - type_2 ?v1 - type_3)
 	      (pred_2 ?v6 - object ?v1 - type_3)
	      (pred_3 ?v8 - type_2 ?v4 - type_1)
	      (pred_1 ?v8 - type_2 ?v6 - object ?v4 - type_1))

   (:action op_3
       :parameters  (?v8 - type_2 ?v5 ?v2 - type_3)
       :precondition (and  (pred_4 ?v8 ?v5))
       :effect (and  (pred_4 ?v8 ?v2)
		     (not (pred_4 ?v8 ?v5))))

   (:action op_2
       :parameters (?v8 - type_2 ?v3 - object ?v7 - type_3 ?v4 - type_1)
       :precondition  (and  (pred_2 ?v3 ?v7) (pred_4 ?v8 ?v7) (pred_3 ?v8 ?v4))
       :effect (and (pred_1 ?v8 ?v3 ?v4)
		    (not (pred_2 ?v3 ?v7)) 
		    (not (pred_3 ?v8 ?v4))))

   (:action op_1
       :parameters (?v8 - type_2 ?v3 - object ?v7 - type_3 ?v4 - type_1)
       :precondition  (and  (pred_1 ?v8 ?v3 ?v4) (pred_4 ?v8 ?v7))
       :effect (and (pred_2 ?v3 ?v7)
		    (pred_3 ?v8 ?v4)
		    (not (pred_1 ?v8 ?v3 ?v4)))))