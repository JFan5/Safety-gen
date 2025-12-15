(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_3 ?v3 - type_1 ?v4 - type_2)
 	      (pred_2 ?v2 - object ?v4 - type_2)
	      (pred_4 ?v3 - type_1 ?v1 - type_3)
	      (pred_1 ?v3 - type_1 ?v2 - object ?v1 - type_3))

   (:action op_1
       :parameters  (?v3 - type_1 ?v7 ?v6 - type_2)
       :precondition (and  (pred_3 ?v3 ?v7))
       :effect (and  (pred_3 ?v3 ?v6)
		     (not (pred_3 ?v3 ?v7))))

   (:action op_2
       :parameters (?v3 - type_1 ?v8 - object ?v5 - type_2 ?v1 - type_3)
       :precondition  (and  (pred_2 ?v8 ?v5) (pred_3 ?v3 ?v5) (pred_4 ?v3 ?v1))
       :effect (and (pred_1 ?v3 ?v8 ?v1)
		    (not (pred_2 ?v8 ?v5)) 
		    (not (pred_4 ?v3 ?v1))))

   (:action op_3
       :parameters (?v3 - type_1 ?v8 - object ?v5 - type_2 ?v1 - type_3)
       :precondition  (and  (pred_1 ?v3 ?v8 ?v1) (pred_3 ?v3 ?v5))
       :effect (and (pred_2 ?v8 ?v5)
		    (pred_4 ?v3 ?v1)
		    (not (pred_1 ?v3 ?v8 ?v1)))))