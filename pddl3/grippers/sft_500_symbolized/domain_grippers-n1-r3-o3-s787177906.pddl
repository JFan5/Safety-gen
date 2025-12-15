(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_3 ?v4 - type_2 ?v2 - type_3)
 	      (pred_1 ?v5 - object ?v2 - type_3)
	      (pred_4 ?v4 - type_2 ?v3 - type_1)
	      (pred_2 ?v4 - type_2 ?v5 - object ?v3 - type_1))

   (:action op_3
       :parameters  (?v4 - type_2 ?v7 ?v6 - type_3)
       :precondition (and  (pred_3 ?v4 ?v7))
       :effect (and  (pred_3 ?v4 ?v6)
		     (not (pred_3 ?v4 ?v7))))

   (:action op_2
       :parameters (?v4 - type_2 ?v8 - object ?v1 - type_3 ?v3 - type_1)
       :precondition  (and  (pred_1 ?v8 ?v1) (pred_3 ?v4 ?v1) (pred_4 ?v4 ?v3))
       :effect (and (pred_2 ?v4 ?v8 ?v3)
		    (not (pred_1 ?v8 ?v1)) 
		    (not (pred_4 ?v4 ?v3))))

   (:action op_1
       :parameters (?v4 - type_2 ?v8 - object ?v1 - type_3 ?v3 - type_1)
       :precondition  (and  (pred_2 ?v4 ?v8 ?v3) (pred_3 ?v4 ?v1))
       :effect (and (pred_1 ?v8 ?v1)
		    (pred_4 ?v4 ?v3)
		    (not (pred_2 ?v4 ?v8 ?v3)))))