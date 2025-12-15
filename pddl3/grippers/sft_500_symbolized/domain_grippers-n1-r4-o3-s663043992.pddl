(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_3 ?v1 - type_3 ?v8 - type_2)
 	      (pred_1 ?v4 - object ?v8 - type_2)
	      (pred_4 ?v1 - type_3 ?v5 - type_1)
	      (pred_2 ?v1 - type_3 ?v4 - object ?v5 - type_1))

   (:action op_3
       :parameters  (?v1 - type_3 ?v2 ?v7 - type_2)
       :precondition (and  (pred_3 ?v1 ?v2))
       :effect (and  (pred_3 ?v1 ?v7)
		     (not (pred_3 ?v1 ?v2))))

   (:action op_1
       :parameters (?v1 - type_3 ?v6 - object ?v3 - type_2 ?v5 - type_1)
       :precondition  (and  (pred_1 ?v6 ?v3) (pred_3 ?v1 ?v3) (pred_4 ?v1 ?v5))
       :effect (and (pred_2 ?v1 ?v6 ?v5)
		    (not (pred_1 ?v6 ?v3)) 
		    (not (pred_4 ?v1 ?v5))))

   (:action op_2
       :parameters (?v1 - type_3 ?v6 - object ?v3 - type_2 ?v5 - type_1)
       :precondition  (and  (pred_2 ?v1 ?v6 ?v5) (pred_3 ?v1 ?v3))
       :effect (and (pred_1 ?v6 ?v3)
		    (pred_4 ?v1 ?v5)
		    (not (pred_2 ?v1 ?v6 ?v5)))))