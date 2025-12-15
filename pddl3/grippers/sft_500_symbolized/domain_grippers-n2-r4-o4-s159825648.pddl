(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_4 ?v2 - type_1 ?v1 - type_3)
 	      (pred_2 ?v5 - object ?v1 - type_3)
	      (pred_1 ?v2 - type_1 ?v7 - type_2)
	      (pred_3 ?v2 - type_1 ?v5 - object ?v7 - type_2))

   (:action op_3
       :parameters  (?v2 - type_1 ?v4 ?v8 - type_3)
       :precondition (and  (pred_4 ?v2 ?v4))
       :effect (and  (pred_4 ?v2 ?v8)
		     (not (pred_4 ?v2 ?v4))))

   (:action op_2
       :parameters (?v2 - type_1 ?v3 - object ?v6 - type_3 ?v7 - type_2)
       :precondition  (and  (pred_2 ?v3 ?v6) (pred_4 ?v2 ?v6) (pred_1 ?v2 ?v7))
       :effect (and (pred_3 ?v2 ?v3 ?v7)
		    (not (pred_2 ?v3 ?v6)) 
		    (not (pred_1 ?v2 ?v7))))

   (:action op_1
       :parameters (?v2 - type_1 ?v3 - object ?v6 - type_3 ?v7 - type_2)
       :precondition  (and  (pred_3 ?v2 ?v3 ?v7) (pred_4 ?v2 ?v6))
       :effect (and (pred_2 ?v3 ?v6)
		    (pred_1 ?v2 ?v7)
		    (not (pred_3 ?v2 ?v3 ?v7)))))