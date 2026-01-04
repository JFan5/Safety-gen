(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_1 ?v8 - type_2 ?v6 - type_1)
 	      (pred_2 ?v4 - object ?v6 - type_1)
	      (pred_3 ?v8 - type_2 ?v3 - type_3)
	      (pred_4 ?v8 - type_2 ?v4 - object ?v3 - type_3))

   (:action op_2
       :parameters  (?v8 - type_2 ?v2 ?v5 - type_1)
       :precondition (and  (pred_1 ?v8 ?v2))
       :effect (and  (pred_1 ?v8 ?v5)
		     (not (pred_1 ?v8 ?v2))))

   (:action op_1
       :parameters (?v8 - type_2 ?v1 - object ?v7 - type_1 ?v3 - type_3)
       :precondition  (and  (pred_2 ?v1 ?v7) (pred_1 ?v8 ?v7) (pred_3 ?v8 ?v3))
       :effect (and (pred_4 ?v8 ?v1 ?v3)
		    (not (pred_2 ?v1 ?v7)) 
		    (not (pred_3 ?v8 ?v3))))

   (:action op_3
       :parameters (?v8 - type_2 ?v1 - object ?v7 - type_1 ?v3 - type_3)
       :precondition  (and  (pred_4 ?v8 ?v1 ?v3) (pred_1 ?v8 ?v7))
       :effect (and (pred_2 ?v1 ?v7)
		    (pred_3 ?v8 ?v3)
		    (not (pred_4 ?v8 ?v1 ?v3)))))