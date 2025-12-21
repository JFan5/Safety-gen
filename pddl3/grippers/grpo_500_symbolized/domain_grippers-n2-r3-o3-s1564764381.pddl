(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_4 ?v4 - type_3 ?v5 - type_1)
 	      (pred_3 ?v2 - object ?v5 - type_1)
	      (pred_1 ?v4 - type_3 ?v8 - type_2)
	      (pred_2 ?v4 - type_3 ?v2 - object ?v8 - type_2))

   (:action op_1
       :parameters  (?v4 - type_3 ?v7 ?v1 - type_1)
       :precondition (and  (pred_4 ?v4 ?v7))
       :effect (and  (pred_4 ?v4 ?v1)
		     (not (pred_4 ?v4 ?v7))))

   (:action op_2
       :parameters (?v4 - type_3 ?v6 - object ?v3 - type_1 ?v8 - type_2)
       :precondition  (and  (pred_3 ?v6 ?v3) (pred_4 ?v4 ?v3) (pred_1 ?v4 ?v8))
       :effect (and (pred_2 ?v4 ?v6 ?v8)
		    (not (pred_3 ?v6 ?v3)) 
		    (not (pred_1 ?v4 ?v8))))

   (:action op_3
       :parameters (?v4 - type_3 ?v6 - object ?v3 - type_1 ?v8 - type_2)
       :precondition  (and  (pred_2 ?v4 ?v6 ?v8) (pred_4 ?v4 ?v3))
       :effect (and (pred_3 ?v6 ?v3)
		    (pred_1 ?v4 ?v8)
		    (not (pred_2 ?v4 ?v6 ?v8)))))