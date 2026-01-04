(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_3 ?v1 - type_2 ?v2 - type_3)
 	      (pred_2 ?v7 - object ?v2 - type_3)
	      (pred_1 ?v1 - type_2 ?v5 - type_1)
	      (pred_4 ?v1 - type_2 ?v7 - object ?v5 - type_1))

   (:action op_3
       :parameters  (?v1 - type_2 ?v8 ?v4 - type_3)
       :precondition (and  (pred_3 ?v1 ?v8))
       :effect (and  (pred_3 ?v1 ?v4)
		     (not (pred_3 ?v1 ?v8))))

   (:action op_1
       :parameters (?v1 - type_2 ?v6 - object ?v3 - type_3 ?v5 - type_1)
       :precondition  (and  (pred_2 ?v6 ?v3) (pred_3 ?v1 ?v3) (pred_1 ?v1 ?v5))
       :effect (and (pred_4 ?v1 ?v6 ?v5)
		    (not (pred_2 ?v6 ?v3)) 
		    (not (pred_1 ?v1 ?v5))))

   (:action op_2
       :parameters (?v1 - type_2 ?v6 - object ?v3 - type_3 ?v5 - type_1)
       :precondition  (and  (pred_4 ?v1 ?v6 ?v5) (pred_3 ?v1 ?v3))
       :effect (and (pred_2 ?v6 ?v3)
		    (pred_1 ?v1 ?v5)
		    (not (pred_4 ?v1 ?v6 ?v5)))))