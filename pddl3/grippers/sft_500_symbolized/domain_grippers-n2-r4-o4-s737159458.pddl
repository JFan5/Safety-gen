(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_3 ?v4 - type_3 ?v5 - type_2)
 	      (pred_2 ?v1 - object ?v5 - type_2)
	      (pred_4 ?v4 - type_3 ?v3 - type_1)
	      (pred_1 ?v4 - type_3 ?v1 - object ?v3 - type_1))

   (:action op_3
       :parameters  (?v4 - type_3 ?v8 ?v6 - type_2)
       :precondition (and  (pred_3 ?v4 ?v8))
       :effect (and  (pred_3 ?v4 ?v6)
		     (not (pred_3 ?v4 ?v8))))

   (:action op_1
       :parameters (?v4 - type_3 ?v2 - object ?v7 - type_2 ?v3 - type_1)
       :precondition  (and  (pred_2 ?v2 ?v7) (pred_3 ?v4 ?v7) (pred_4 ?v4 ?v3))
       :effect (and (pred_1 ?v4 ?v2 ?v3)
		    (not (pred_2 ?v2 ?v7)) 
		    (not (pred_4 ?v4 ?v3))))

   (:action op_2
       :parameters (?v4 - type_3 ?v2 - object ?v7 - type_2 ?v3 - type_1)
       :precondition  (and  (pred_1 ?v4 ?v2 ?v3) (pred_3 ?v4 ?v7))
       :effect (and (pred_2 ?v2 ?v7)
		    (pred_4 ?v4 ?v3)
		    (not (pred_1 ?v4 ?v2 ?v3)))))