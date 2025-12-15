(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_1 ?v4 - type_2 ?v2 - type_1)
 	      (pred_3 ?v8 - object ?v2 - type_1)
	      (pred_2 ?v4 - type_2 ?v3 - type_3)
	      (pred_4 ?v4 - type_2 ?v8 - object ?v3 - type_3))

   (:action op_3
       :parameters  (?v4 - type_2 ?v6 ?v7 - type_1)
       :precondition (and  (pred_1 ?v4 ?v6))
       :effect (and  (pred_1 ?v4 ?v7)
		     (not (pred_1 ?v4 ?v6))))

   (:action op_2
       :parameters (?v4 - type_2 ?v5 - object ?v1 - type_1 ?v3 - type_3)
       :precondition  (and  (pred_3 ?v5 ?v1) (pred_1 ?v4 ?v1) (pred_2 ?v4 ?v3))
       :effect (and (pred_4 ?v4 ?v5 ?v3)
		    (not (pred_3 ?v5 ?v1)) 
		    (not (pred_2 ?v4 ?v3))))

   (:action op_1
       :parameters (?v4 - type_2 ?v5 - object ?v1 - type_1 ?v3 - type_3)
       :precondition  (and  (pred_4 ?v4 ?v5 ?v3) (pred_1 ?v4 ?v1))
       :effect (and (pred_3 ?v5 ?v1)
		    (pred_2 ?v4 ?v3)
		    (not (pred_4 ?v4 ?v5 ?v3)))))