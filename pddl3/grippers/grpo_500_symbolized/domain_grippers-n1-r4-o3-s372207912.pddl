(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_2 ?v7 - type_2 ?v5 - type_1)
 	      (pred_1 ?v4 - object ?v5 - type_1)
	      (pred_3 ?v7 - type_2 ?v6 - type_3)
	      (pred_4 ?v7 - type_2 ?v4 - object ?v6 - type_3))

   (:action op_2
       :parameters  (?v7 - type_2 ?v8 ?v3 - type_1)
       :precondition (and  (pred_2 ?v7 ?v8))
       :effect (and  (pred_2 ?v7 ?v3)
		     (not (pred_2 ?v7 ?v8))))

   (:action op_1
       :parameters (?v7 - type_2 ?v1 - object ?v2 - type_1 ?v6 - type_3)
       :precondition  (and  (pred_1 ?v1 ?v2) (pred_2 ?v7 ?v2) (pred_3 ?v7 ?v6))
       :effect (and (pred_4 ?v7 ?v1 ?v6)
		    (not (pred_1 ?v1 ?v2)) 
		    (not (pred_3 ?v7 ?v6))))

   (:action op_3
       :parameters (?v7 - type_2 ?v1 - object ?v2 - type_1 ?v6 - type_3)
       :precondition  (and  (pred_4 ?v7 ?v1 ?v6) (pred_2 ?v7 ?v2))
       :effect (and (pred_1 ?v1 ?v2)
		    (pred_3 ?v7 ?v6)
		    (not (pred_4 ?v7 ?v1 ?v6)))))