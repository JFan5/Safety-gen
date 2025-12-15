(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_3 ?v5 - type_1 ?v8 - type_3)
 	      (pred_4 ?v3 - object ?v8 - type_3)
	      (pred_1 ?v5 - type_1 ?v7 - type_2)
	      (pred_2 ?v5 - type_1 ?v3 - object ?v7 - type_2))

   (:action op_1
       :parameters  (?v5 - type_1 ?v2 ?v4 - type_3)
       :precondition (and  (pred_3 ?v5 ?v2))
       :effect (and  (pred_3 ?v5 ?v4)
		     (not (pred_3 ?v5 ?v2))))

   (:action op_2
       :parameters (?v5 - type_1 ?v1 - object ?v6 - type_3 ?v7 - type_2)
       :precondition  (and  (pred_4 ?v1 ?v6) (pred_3 ?v5 ?v6) (pred_1 ?v5 ?v7))
       :effect (and (pred_2 ?v5 ?v1 ?v7)
		    (not (pred_4 ?v1 ?v6)) 
		    (not (pred_1 ?v5 ?v7))))

   (:action op_3
       :parameters (?v5 - type_1 ?v1 - object ?v6 - type_3 ?v7 - type_2)
       :precondition  (and  (pred_2 ?v5 ?v1 ?v7) (pred_3 ?v5 ?v6))
       :effect (and (pred_4 ?v1 ?v6)
		    (pred_1 ?v5 ?v7)
		    (not (pred_2 ?v5 ?v1 ?v7)))))