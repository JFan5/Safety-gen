(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_2 ?v8 - type_3 ?v4 - type_1)
 	      (pred_3 ?v6 - object ?v4 - type_1)
	      (pred_1 ?v8 - type_3 ?v7 - type_2)
	      (pred_4 ?v8 - type_3 ?v6 - object ?v7 - type_2))

   (:action op_1
       :parameters  (?v8 - type_3 ?v1 ?v5 - type_1)
       :precondition (and  (pred_2 ?v8 ?v1))
       :effect (and  (pred_2 ?v8 ?v5)
		     (not (pred_2 ?v8 ?v1))))

   (:action op_3
       :parameters (?v8 - type_3 ?v3 - object ?v2 - type_1 ?v7 - type_2)
       :precondition  (and  (pred_3 ?v3 ?v2) (pred_2 ?v8 ?v2) (pred_1 ?v8 ?v7))
       :effect (and (pred_4 ?v8 ?v3 ?v7)
		    (not (pred_3 ?v3 ?v2)) 
		    (not (pred_1 ?v8 ?v7))))

   (:action op_2
       :parameters (?v8 - type_3 ?v3 - object ?v2 - type_1 ?v7 - type_2)
       :precondition  (and  (pred_4 ?v8 ?v3 ?v7) (pred_2 ?v8 ?v2))
       :effect (and (pred_3 ?v3 ?v2)
		    (pred_1 ?v8 ?v7)
		    (not (pred_4 ?v8 ?v3 ?v7)))))