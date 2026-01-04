(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_1 ?v1 - type_3 ?v8 - type_1)
 	      (pred_4 ?v4 - object ?v8 - type_1)
	      (pred_3 ?v1 - type_3 ?v7 - type_2)
	      (pred_2 ?v1 - type_3 ?v4 - object ?v7 - type_2))

   (:action op_3
       :parameters  (?v1 - type_3 ?v3 ?v6 - type_1)
       :precondition (and  (pred_1 ?v1 ?v3))
       :effect (and  (pred_1 ?v1 ?v6)
		     (not (pred_1 ?v1 ?v3))))

   (:action op_1
       :parameters (?v1 - type_3 ?v5 - object ?v2 - type_1 ?v7 - type_2)
       :precondition  (and  (pred_4 ?v5 ?v2) (pred_1 ?v1 ?v2) (pred_3 ?v1 ?v7))
       :effect (and (pred_2 ?v1 ?v5 ?v7)
		    (not (pred_4 ?v5 ?v2)) 
		    (not (pred_3 ?v1 ?v7))))

   (:action op_2
       :parameters (?v1 - type_3 ?v5 - object ?v2 - type_1 ?v7 - type_2)
       :precondition  (and  (pred_2 ?v1 ?v5 ?v7) (pred_1 ?v1 ?v2))
       :effect (and (pred_4 ?v5 ?v2)
		    (pred_3 ?v1 ?v7)
		    (not (pred_2 ?v1 ?v5 ?v7)))))