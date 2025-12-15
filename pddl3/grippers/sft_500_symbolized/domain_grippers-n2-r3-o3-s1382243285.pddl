(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_4 ?v3 - type_1 ?v7 - type_3)
 	      (pred_3 ?v4 - object ?v7 - type_3)
	      (pred_1 ?v3 - type_1 ?v1 - type_2)
	      (pred_2 ?v3 - type_1 ?v4 - object ?v1 - type_2))

   (:action op_3
       :parameters  (?v3 - type_1 ?v2 ?v6 - type_3)
       :precondition (and  (pred_4 ?v3 ?v2))
       :effect (and  (pred_4 ?v3 ?v6)
		     (not (pred_4 ?v3 ?v2))))

   (:action op_1
       :parameters (?v3 - type_1 ?v8 - object ?v5 - type_3 ?v1 - type_2)
       :precondition  (and  (pred_3 ?v8 ?v5) (pred_4 ?v3 ?v5) (pred_1 ?v3 ?v1))
       :effect (and (pred_2 ?v3 ?v8 ?v1)
		    (not (pred_3 ?v8 ?v5)) 
		    (not (pred_1 ?v3 ?v1))))

   (:action op_2
       :parameters (?v3 - type_1 ?v8 - object ?v5 - type_3 ?v1 - type_2)
       :precondition  (and  (pred_2 ?v3 ?v8 ?v1) (pred_4 ?v3 ?v5))
       :effect (and (pred_3 ?v8 ?v5)
		    (pred_1 ?v3 ?v1)
		    (not (pred_2 ?v3 ?v8 ?v1)))))