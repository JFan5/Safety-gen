(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_1 ?v5 - type_2 ?v1 - type_3)
 	      (pred_3 ?v6 - object ?v1 - type_3)
	      (pred_2 ?v5 - type_2 ?v7 - type_1)
	      (pred_4 ?v5 - type_2 ?v6 - object ?v7 - type_1))

   (:action op_1
       :parameters  (?v5 - type_2 ?v2 ?v4 - type_3)
       :precondition (and  (pred_1 ?v5 ?v2))
       :effect (and  (pred_1 ?v5 ?v4)
		     (not (pred_1 ?v5 ?v2))))

   (:action op_3
       :parameters (?v5 - type_2 ?v3 - object ?v8 - type_3 ?v7 - type_1)
       :precondition  (and  (pred_3 ?v3 ?v8) (pred_1 ?v5 ?v8) (pred_2 ?v5 ?v7))
       :effect (and (pred_4 ?v5 ?v3 ?v7)
		    (not (pred_3 ?v3 ?v8)) 
		    (not (pred_2 ?v5 ?v7))))

   (:action op_2
       :parameters (?v5 - type_2 ?v3 - object ?v8 - type_3 ?v7 - type_1)
       :precondition  (and  (pred_4 ?v5 ?v3 ?v7) (pred_1 ?v5 ?v8))
       :effect (and (pred_3 ?v3 ?v8)
		    (pred_2 ?v5 ?v7)
		    (not (pred_4 ?v5 ?v3 ?v7)))))