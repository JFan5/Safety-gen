(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_1 ?v6 - type_2 ?v7 - type_3)
 	      (pred_3 ?v1 - object ?v7 - type_3)
	      (pred_4 ?v6 - type_2 ?v2 - type_1)
	      (pred_2 ?v6 - type_2 ?v1 - object ?v2 - type_1))

   (:action op_3
       :parameters  (?v6 - type_2 ?v3 ?v4 - type_3)
       :precondition (and  (pred_1 ?v6 ?v3))
       :effect (and  (pred_1 ?v6 ?v4)
		     (not (pred_1 ?v6 ?v3))))

   (:action op_1
       :parameters (?v6 - type_2 ?v5 - object ?v8 - type_3 ?v2 - type_1)
       :precondition  (and  (pred_3 ?v5 ?v8) (pred_1 ?v6 ?v8) (pred_4 ?v6 ?v2))
       :effect (and (pred_2 ?v6 ?v5 ?v2)
		    (not (pred_3 ?v5 ?v8)) 
		    (not (pred_4 ?v6 ?v2))))

   (:action op_2
       :parameters (?v6 - type_2 ?v5 - object ?v8 - type_3 ?v2 - type_1)
       :precondition  (and  (pred_2 ?v6 ?v5 ?v2) (pred_1 ?v6 ?v8))
       :effect (and (pred_3 ?v5 ?v8)
		    (pred_4 ?v6 ?v2)
		    (not (pred_2 ?v6 ?v5 ?v2)))))