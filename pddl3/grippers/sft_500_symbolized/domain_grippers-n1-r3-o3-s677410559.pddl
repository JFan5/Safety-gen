(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_3 ?v3 - type_2 ?v5 - type_3)
 	      (pred_2 ?v7 - object ?v5 - type_3)
	      (pred_1 ?v3 - type_2 ?v4 - type_1)
	      (pred_4 ?v3 - type_2 ?v7 - object ?v4 - type_1))

   (:action op_1
       :parameters  (?v3 - type_2 ?v2 ?v1 - type_3)
       :precondition (and  (pred_3 ?v3 ?v2))
       :effect (and  (pred_3 ?v3 ?v1)
		     (not (pred_3 ?v3 ?v2))))

   (:action op_3
       :parameters (?v3 - type_2 ?v6 - object ?v8 - type_3 ?v4 - type_1)
       :precondition  (and  (pred_2 ?v6 ?v8) (pred_3 ?v3 ?v8) (pred_1 ?v3 ?v4))
       :effect (and (pred_4 ?v3 ?v6 ?v4)
		    (not (pred_2 ?v6 ?v8)) 
		    (not (pred_1 ?v3 ?v4))))

   (:action op_2
       :parameters (?v3 - type_2 ?v6 - object ?v8 - type_3 ?v4 - type_1)
       :precondition  (and  (pred_4 ?v3 ?v6 ?v4) (pred_3 ?v3 ?v8))
       :effect (and (pred_2 ?v6 ?v8)
		    (pred_1 ?v3 ?v4)
		    (not (pred_4 ?v3 ?v6 ?v4)))))