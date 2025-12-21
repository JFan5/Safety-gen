(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_3 ?v2 - type_2 ?v5 - type_3)
 	      (pred_4 ?v3 - object ?v5 - type_3)
	      (pred_2 ?v2 - type_2 ?v7 - type_1)
	      (pred_1 ?v2 - type_2 ?v3 - object ?v7 - type_1))

   (:action op_1
       :parameters  (?v2 - type_2 ?v8 ?v6 - type_3)
       :precondition (and  (pred_3 ?v2 ?v8))
       :effect (and  (pred_3 ?v2 ?v6)
		     (not (pred_3 ?v2 ?v8))))

   (:action op_2
       :parameters (?v2 - type_2 ?v1 - object ?v4 - type_3 ?v7 - type_1)
       :precondition  (and  (pred_4 ?v1 ?v4) (pred_3 ?v2 ?v4) (pred_2 ?v2 ?v7))
       :effect (and (pred_1 ?v2 ?v1 ?v7)
		    (not (pred_4 ?v1 ?v4)) 
		    (not (pred_2 ?v2 ?v7))))

   (:action op_3
       :parameters (?v2 - type_2 ?v1 - object ?v4 - type_3 ?v7 - type_1)
       :precondition  (and  (pred_1 ?v2 ?v1 ?v7) (pred_3 ?v2 ?v4))
       :effect (and (pred_4 ?v1 ?v4)
		    (pred_2 ?v2 ?v7)
		    (not (pred_1 ?v2 ?v1 ?v7)))))