(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_2 ?v8 - type_2 ?v1 - type_1)
 	      (pred_4 ?v6 - object ?v1 - type_1)
	      (pred_1 ?v8 - type_2 ?v4 - type_3)
	      (pred_3 ?v8 - type_2 ?v6 - object ?v4 - type_3))

   (:action op_2
       :parameters  (?v8 - type_2 ?v3 ?v7 - type_1)
       :precondition (and  (pred_2 ?v8 ?v3))
       :effect (and  (pred_2 ?v8 ?v7)
		     (not (pred_2 ?v8 ?v3))))

   (:action op_1
       :parameters (?v8 - type_2 ?v2 - object ?v5 - type_1 ?v4 - type_3)
       :precondition  (and  (pred_4 ?v2 ?v5) (pred_2 ?v8 ?v5) (pred_1 ?v8 ?v4))
       :effect (and (pred_3 ?v8 ?v2 ?v4)
		    (not (pred_4 ?v2 ?v5)) 
		    (not (pred_1 ?v8 ?v4))))

   (:action op_3
       :parameters (?v8 - type_2 ?v2 - object ?v5 - type_1 ?v4 - type_3)
       :precondition  (and  (pred_3 ?v8 ?v2 ?v4) (pred_2 ?v8 ?v5))
       :effect (and (pred_4 ?v2 ?v5)
		    (pred_1 ?v8 ?v4)
		    (not (pred_3 ?v8 ?v2 ?v4)))))