(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_4 ?v6 - type_2 ?v7 - type_1)
 	      (pred_1 ?v3 - object ?v7 - type_1)
	      (pred_3 ?v6 - type_2 ?v1 - type_3)
	      (pred_2 ?v6 - type_2 ?v3 - object ?v1 - type_3))

   (:action op_1
       :parameters  (?v6 - type_2 ?v5 ?v2 - type_1)
       :precondition (and  (pred_4 ?v6 ?v5))
       :effect (and  (pred_4 ?v6 ?v2)
		     (not (pred_4 ?v6 ?v5))))

   (:action op_3
       :parameters (?v6 - type_2 ?v8 - object ?v4 - type_1 ?v1 - type_3)
       :precondition  (and  (pred_1 ?v8 ?v4) (pred_4 ?v6 ?v4) (pred_3 ?v6 ?v1))
       :effect (and (pred_2 ?v6 ?v8 ?v1)
		    (not (pred_1 ?v8 ?v4)) 
		    (not (pred_3 ?v6 ?v1))))

   (:action op_2
       :parameters (?v6 - type_2 ?v8 - object ?v4 - type_1 ?v1 - type_3)
       :precondition  (and  (pred_2 ?v6 ?v8 ?v1) (pred_4 ?v6 ?v4))
       :effect (and (pred_1 ?v8 ?v4)
		    (pred_3 ?v6 ?v1)
		    (not (pred_2 ?v6 ?v8 ?v1)))))