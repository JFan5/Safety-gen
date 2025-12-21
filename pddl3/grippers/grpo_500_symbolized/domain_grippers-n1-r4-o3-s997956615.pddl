(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_2 ?v6 - type_1 ?v8 - type_3)
 	      (pred_1 ?v3 - object ?v8 - type_3)
	      (pred_4 ?v6 - type_1 ?v5 - type_2)
	      (pred_3 ?v6 - type_1 ?v3 - object ?v5 - type_2))

   (:action op_1
       :parameters  (?v6 - type_1 ?v7 ?v4 - type_3)
       :precondition (and  (pred_2 ?v6 ?v7))
       :effect (and  (pred_2 ?v6 ?v4)
		     (not (pred_2 ?v6 ?v7))))

   (:action op_2
       :parameters (?v6 - type_1 ?v2 - object ?v1 - type_3 ?v5 - type_2)
       :precondition  (and  (pred_1 ?v2 ?v1) (pred_2 ?v6 ?v1) (pred_4 ?v6 ?v5))
       :effect (and (pred_3 ?v6 ?v2 ?v5)
		    (not (pred_1 ?v2 ?v1)) 
		    (not (pred_4 ?v6 ?v5))))

   (:action op_3
       :parameters (?v6 - type_1 ?v2 - object ?v1 - type_3 ?v5 - type_2)
       :precondition  (and  (pred_3 ?v6 ?v2 ?v5) (pred_2 ?v6 ?v1))
       :effect (and (pred_1 ?v2 ?v1)
		    (pred_4 ?v6 ?v5)
		    (not (pred_3 ?v6 ?v2 ?v5)))))