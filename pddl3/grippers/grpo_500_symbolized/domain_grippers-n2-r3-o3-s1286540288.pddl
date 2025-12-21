(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_1 ?v8 - type_3 ?v2 - type_1)
 	      (pred_2 ?v6 - object ?v2 - type_1)
	      (pred_3 ?v8 - type_3 ?v4 - type_2)
	      (pred_4 ?v8 - type_3 ?v6 - object ?v4 - type_2))

   (:action op_3
       :parameters  (?v8 - type_3 ?v3 ?v7 - type_1)
       :precondition (and  (pred_1 ?v8 ?v3))
       :effect (and  (pred_1 ?v8 ?v7)
		     (not (pred_1 ?v8 ?v3))))

   (:action op_2
       :parameters (?v8 - type_3 ?v5 - object ?v1 - type_1 ?v4 - type_2)
       :precondition  (and  (pred_2 ?v5 ?v1) (pred_1 ?v8 ?v1) (pred_3 ?v8 ?v4))
       :effect (and (pred_4 ?v8 ?v5 ?v4)
		    (not (pred_2 ?v5 ?v1)) 
		    (not (pred_3 ?v8 ?v4))))

   (:action op_1
       :parameters (?v8 - type_3 ?v5 - object ?v1 - type_1 ?v4 - type_2)
       :precondition  (and  (pred_4 ?v8 ?v5 ?v4) (pred_1 ?v8 ?v1))
       :effect (and (pred_2 ?v5 ?v1)
		    (pred_3 ?v8 ?v4)
		    (not (pred_4 ?v8 ?v5 ?v4)))))