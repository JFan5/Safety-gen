(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_2 ?v8 - type_1 ?v3 - type_2)
 	      (pred_3 ?v4 - object ?v3 - type_2)
	      (pred_4 ?v8 - type_1 ?v2 - type_3)
	      (pred_1 ?v8 - type_1 ?v4 - object ?v2 - type_3))

   (:action op_1
       :parameters  (?v8 - type_1 ?v7 ?v1 - type_2)
       :precondition (and  (pred_2 ?v8 ?v7))
       :effect (and  (pred_2 ?v8 ?v1)
		     (not (pred_2 ?v8 ?v7))))

   (:action op_3
       :parameters (?v8 - type_1 ?v6 - object ?v5 - type_2 ?v2 - type_3)
       :precondition  (and  (pred_3 ?v6 ?v5) (pred_2 ?v8 ?v5) (pred_4 ?v8 ?v2))
       :effect (and (pred_1 ?v8 ?v6 ?v2)
		    (not (pred_3 ?v6 ?v5)) 
		    (not (pred_4 ?v8 ?v2))))

   (:action op_2
       :parameters (?v8 - type_1 ?v6 - object ?v5 - type_2 ?v2 - type_3)
       :precondition  (and  (pred_1 ?v8 ?v6 ?v2) (pred_2 ?v8 ?v5))
       :effect (and (pred_3 ?v6 ?v5)
		    (pred_4 ?v8 ?v2)
		    (not (pred_1 ?v8 ?v6 ?v2)))))