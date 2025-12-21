(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_4 ?v2 - type_2 ?v7 - type_3)
 	      (pred_1 ?v5 - object ?v7 - type_3)
	      (pred_3 ?v2 - type_2 ?v8 - type_1)
	      (pred_2 ?v2 - type_2 ?v5 - object ?v8 - type_1))

   (:action op_1
       :parameters  (?v2 - type_2 ?v1 ?v4 - type_3)
       :precondition (and  (pred_4 ?v2 ?v1))
       :effect (and  (pred_4 ?v2 ?v4)
		     (not (pred_4 ?v2 ?v1))))

   (:action op_2
       :parameters (?v2 - type_2 ?v6 - object ?v3 - type_3 ?v8 - type_1)
       :precondition  (and  (pred_1 ?v6 ?v3) (pred_4 ?v2 ?v3) (pred_3 ?v2 ?v8))
       :effect (and (pred_2 ?v2 ?v6 ?v8)
		    (not (pred_1 ?v6 ?v3)) 
		    (not (pred_3 ?v2 ?v8))))

   (:action op_3
       :parameters (?v2 - type_2 ?v6 - object ?v3 - type_3 ?v8 - type_1)
       :precondition  (and  (pred_2 ?v2 ?v6 ?v8) (pred_4 ?v2 ?v3))
       :effect (and (pred_1 ?v6 ?v3)
		    (pred_3 ?v2 ?v8)
		    (not (pred_2 ?v2 ?v6 ?v8)))))