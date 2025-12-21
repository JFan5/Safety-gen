(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_3 ?v1 - type_3 ?v2 - type_2)
 	      (pred_4 ?v3 - object ?v2 - type_2)
	      (pred_2 ?v1 - type_3 ?v7 - type_1)
	      (pred_1 ?v1 - type_3 ?v3 - object ?v7 - type_1))

   (:action op_3
       :parameters  (?v1 - type_3 ?v6 ?v8 - type_2)
       :precondition (and  (pred_3 ?v1 ?v6))
       :effect (and  (pred_3 ?v1 ?v8)
		     (not (pred_3 ?v1 ?v6))))

   (:action op_2
       :parameters (?v1 - type_3 ?v5 - object ?v4 - type_2 ?v7 - type_1)
       :precondition  (and  (pred_4 ?v5 ?v4) (pred_3 ?v1 ?v4) (pred_2 ?v1 ?v7))
       :effect (and (pred_1 ?v1 ?v5 ?v7)
		    (not (pred_4 ?v5 ?v4)) 
		    (not (pred_2 ?v1 ?v7))))

   (:action op_1
       :parameters (?v1 - type_3 ?v5 - object ?v4 - type_2 ?v7 - type_1)
       :precondition  (and  (pred_1 ?v1 ?v5 ?v7) (pred_3 ?v1 ?v4))
       :effect (and (pred_4 ?v5 ?v4)
		    (pred_2 ?v1 ?v7)
		    (not (pred_1 ?v1 ?v5 ?v7)))))