(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_3 ?v1 - type_1 ?v6 - type_2)
 	      (pred_4 ?v7 - object ?v6 - type_2)
	      (pred_2 ?v1 - type_1 ?v4 - type_3)
	      (pred_1 ?v1 - type_1 ?v7 - object ?v4 - type_3))

   (:action op_3
       :parameters  (?v1 - type_1 ?v2 ?v5 - type_2)
       :precondition (and  (pred_3 ?v1 ?v2))
       :effect (and  (pred_3 ?v1 ?v5)
		     (not (pred_3 ?v1 ?v2))))

   (:action op_2
       :parameters (?v1 - type_1 ?v3 - object ?v8 - type_2 ?v4 - type_3)
       :precondition  (and  (pred_4 ?v3 ?v8) (pred_3 ?v1 ?v8) (pred_2 ?v1 ?v4))
       :effect (and (pred_1 ?v1 ?v3 ?v4)
		    (not (pred_4 ?v3 ?v8)) 
		    (not (pred_2 ?v1 ?v4))))

   (:action op_1
       :parameters (?v1 - type_1 ?v3 - object ?v8 - type_2 ?v4 - type_3)
       :precondition  (and  (pred_1 ?v1 ?v3 ?v4) (pred_3 ?v1 ?v8))
       :effect (and (pred_4 ?v3 ?v8)
		    (pred_2 ?v1 ?v4)
		    (not (pred_1 ?v1 ?v3 ?v4)))))