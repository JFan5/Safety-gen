(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_3 ?v4 - type_2 ?v5 - type_1)
 	      (pred_1 ?v7 - object ?v5 - type_1)
	      (pred_4 ?v4 - type_2 ?v3 - type_3)
	      (pred_2 ?v4 - type_2 ?v7 - object ?v3 - type_3))

   (:action op_3
       :parameters  (?v4 - type_2 ?v1 ?v2 - type_1)
       :precondition (and  (pred_3 ?v4 ?v1))
       :effect (and  (pred_3 ?v4 ?v2)
		     (not (pred_3 ?v4 ?v1))))

   (:action op_2
       :parameters (?v4 - type_2 ?v8 - object ?v6 - type_1 ?v3 - type_3)
       :precondition  (and  (pred_1 ?v8 ?v6) (pred_3 ?v4 ?v6) (pred_4 ?v4 ?v3))
       :effect (and (pred_2 ?v4 ?v8 ?v3)
		    (not (pred_1 ?v8 ?v6)) 
		    (not (pred_4 ?v4 ?v3))))

   (:action op_1
       :parameters (?v4 - type_2 ?v8 - object ?v6 - type_1 ?v3 - type_3)
       :precondition  (and  (pred_2 ?v4 ?v8 ?v3) (pred_3 ?v4 ?v6))
       :effect (and (pred_1 ?v8 ?v6)
		    (pred_4 ?v4 ?v3)
		    (not (pred_2 ?v4 ?v8 ?v3)))))