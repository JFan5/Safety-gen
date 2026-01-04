(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_3 ?v6 - type_2 ?v5 - type_1)
 	      (pred_1 ?v2 - object ?v5 - type_1)
	      (pred_2 ?v6 - type_2 ?v8 - type_3)
	      (pred_4 ?v6 - type_2 ?v2 - object ?v8 - type_3))

   (:action op_3
       :parameters  (?v6 - type_2 ?v3 ?v1 - type_1)
       :precondition (and  (pred_3 ?v6 ?v3))
       :effect (and  (pred_3 ?v6 ?v1)
		     (not (pred_3 ?v6 ?v3))))

   (:action op_2
       :parameters (?v6 - type_2 ?v4 - object ?v7 - type_1 ?v8 - type_3)
       :precondition  (and  (pred_1 ?v4 ?v7) (pred_3 ?v6 ?v7) (pred_2 ?v6 ?v8))
       :effect (and (pred_4 ?v6 ?v4 ?v8)
		    (not (pred_1 ?v4 ?v7)) 
		    (not (pred_2 ?v6 ?v8))))

   (:action op_1
       :parameters (?v6 - type_2 ?v4 - object ?v7 - type_1 ?v8 - type_3)
       :precondition  (and  (pred_4 ?v6 ?v4 ?v8) (pred_3 ?v6 ?v7))
       :effect (and (pred_1 ?v4 ?v7)
		    (pred_2 ?v6 ?v8)
		    (not (pred_4 ?v6 ?v4 ?v8)))))