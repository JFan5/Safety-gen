(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_1 ?v3 - type_3 ?v6 - type_1)
 	      (pred_4 ?v5 - object ?v6 - type_1)
	      (pred_3 ?v3 - type_3 ?v7 - type_2)
	      (pred_2 ?v3 - type_3 ?v5 - object ?v7 - type_2))

   (:action op_3
       :parameters  (?v3 - type_3 ?v2 ?v1 - type_1)
       :precondition (and  (pred_1 ?v3 ?v2))
       :effect (and  (pred_1 ?v3 ?v1)
		     (not (pred_1 ?v3 ?v2))))

   (:action op_2
       :parameters (?v3 - type_3 ?v8 - object ?v4 - type_1 ?v7 - type_2)
       :precondition  (and  (pred_4 ?v8 ?v4) (pred_1 ?v3 ?v4) (pred_3 ?v3 ?v7))
       :effect (and (pred_2 ?v3 ?v8 ?v7)
		    (not (pred_4 ?v8 ?v4)) 
		    (not (pred_3 ?v3 ?v7))))

   (:action op_1
       :parameters (?v3 - type_3 ?v8 - object ?v4 - type_1 ?v7 - type_2)
       :precondition  (and  (pred_2 ?v3 ?v8 ?v7) (pred_1 ?v3 ?v4))
       :effect (and (pred_4 ?v8 ?v4)
		    (pred_3 ?v3 ?v7)
		    (not (pred_2 ?v3 ?v8 ?v7)))))