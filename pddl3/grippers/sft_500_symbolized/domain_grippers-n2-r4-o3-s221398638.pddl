(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_4 ?v6 - type_2 ?v4 - type_1)
 	      (pred_1 ?v5 - object ?v4 - type_1)
	      (pred_3 ?v6 - type_2 ?v1 - type_3)
	      (pred_2 ?v6 - type_2 ?v5 - object ?v1 - type_3))

   (:action op_2
       :parameters  (?v6 - type_2 ?v7 ?v3 - type_1)
       :precondition (and  (pred_4 ?v6 ?v7))
       :effect (and  (pred_4 ?v6 ?v3)
		     (not (pred_4 ?v6 ?v7))))

   (:action op_3
       :parameters (?v6 - type_2 ?v2 - object ?v8 - type_1 ?v1 - type_3)
       :precondition  (and  (pred_1 ?v2 ?v8) (pred_4 ?v6 ?v8) (pred_3 ?v6 ?v1))
       :effect (and (pred_2 ?v6 ?v2 ?v1)
		    (not (pred_1 ?v2 ?v8)) 
		    (not (pred_3 ?v6 ?v1))))

   (:action op_1
       :parameters (?v6 - type_2 ?v2 - object ?v8 - type_1 ?v1 - type_3)
       :precondition  (and  (pred_2 ?v6 ?v2 ?v1) (pred_4 ?v6 ?v8))
       :effect (and (pred_1 ?v2 ?v8)
		    (pred_3 ?v6 ?v1)
		    (not (pred_2 ?v6 ?v2 ?v1)))))