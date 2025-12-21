(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_3 ?v2 - type_2 ?v1 - type_1)
 	      (pred_4 ?v7 - object ?v1 - type_1)
	      (pred_1 ?v2 - type_2 ?v3 - type_3)
	      (pred_2 ?v2 - type_2 ?v7 - object ?v3 - type_3))

   (:action op_1
       :parameters  (?v2 - type_2 ?v4 ?v6 - type_1)
       :precondition (and  (pred_3 ?v2 ?v4))
       :effect (and  (pred_3 ?v2 ?v6)
		     (not (pred_3 ?v2 ?v4))))

   (:action op_3
       :parameters (?v2 - type_2 ?v5 - object ?v8 - type_1 ?v3 - type_3)
       :precondition  (and  (pred_4 ?v5 ?v8) (pred_3 ?v2 ?v8) (pred_1 ?v2 ?v3))
       :effect (and (pred_2 ?v2 ?v5 ?v3)
		    (not (pred_4 ?v5 ?v8)) 
		    (not (pred_1 ?v2 ?v3))))

   (:action op_2
       :parameters (?v2 - type_2 ?v5 - object ?v8 - type_1 ?v3 - type_3)
       :precondition  (and  (pred_2 ?v2 ?v5 ?v3) (pred_3 ?v2 ?v8))
       :effect (and (pred_4 ?v5 ?v8)
		    (pred_1 ?v2 ?v3)
		    (not (pred_2 ?v2 ?v5 ?v3)))))