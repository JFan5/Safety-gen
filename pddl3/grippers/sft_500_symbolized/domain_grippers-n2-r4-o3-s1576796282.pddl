(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_1 ?v6 - type_1 ?v1 - type_3)
 	      (pred_4 ?v4 - object ?v1 - type_3)
	      (pred_3 ?v6 - type_1 ?v8 - type_2)
	      (pred_2 ?v6 - type_1 ?v4 - object ?v8 - type_2))

   (:action op_3
       :parameters  (?v6 - type_1 ?v2 ?v3 - type_3)
       :precondition (and  (pred_1 ?v6 ?v2))
       :effect (and  (pred_1 ?v6 ?v3)
		     (not (pred_1 ?v6 ?v2))))

   (:action op_2
       :parameters (?v6 - type_1 ?v7 - object ?v5 - type_3 ?v8 - type_2)
       :precondition  (and  (pred_4 ?v7 ?v5) (pred_1 ?v6 ?v5) (pred_3 ?v6 ?v8))
       :effect (and (pred_2 ?v6 ?v7 ?v8)
		    (not (pred_4 ?v7 ?v5)) 
		    (not (pred_3 ?v6 ?v8))))

   (:action op_1
       :parameters (?v6 - type_1 ?v7 - object ?v5 - type_3 ?v8 - type_2)
       :precondition  (and  (pred_2 ?v6 ?v7 ?v8) (pred_1 ?v6 ?v5))
       :effect (and (pred_4 ?v7 ?v5)
		    (pred_3 ?v6 ?v8)
		    (not (pred_2 ?v6 ?v7 ?v8)))))