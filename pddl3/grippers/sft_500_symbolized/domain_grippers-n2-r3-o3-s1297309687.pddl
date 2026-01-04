(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_3 ?v5 - type_2 ?v2 - type_3)
 	      (pred_1 ?v4 - object ?v2 - type_3)
	      (pred_4 ?v5 - type_2 ?v8 - type_1)
	      (pred_2 ?v5 - type_2 ?v4 - object ?v8 - type_1))

   (:action op_1
       :parameters  (?v5 - type_2 ?v7 ?v1 - type_3)
       :precondition (and  (pred_3 ?v5 ?v7))
       :effect (and  (pred_3 ?v5 ?v1)
		     (not (pred_3 ?v5 ?v7))))

   (:action op_3
       :parameters (?v5 - type_2 ?v6 - object ?v3 - type_3 ?v8 - type_1)
       :precondition  (and  (pred_1 ?v6 ?v3) (pred_3 ?v5 ?v3) (pred_4 ?v5 ?v8))
       :effect (and (pred_2 ?v5 ?v6 ?v8)
		    (not (pred_1 ?v6 ?v3)) 
		    (not (pred_4 ?v5 ?v8))))

   (:action op_2
       :parameters (?v5 - type_2 ?v6 - object ?v3 - type_3 ?v8 - type_1)
       :precondition  (and  (pred_2 ?v5 ?v6 ?v8) (pred_3 ?v5 ?v3))
       :effect (and (pred_1 ?v6 ?v3)
		    (pred_4 ?v5 ?v8)
		    (not (pred_2 ?v5 ?v6 ?v8)))))