(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_4 ?v1 - type_1 ?v4 - type_2)
 	      (pred_1 ?v5 - object ?v4 - type_2)
	      (pred_3 ?v1 - type_1 ?v7 - type_3)
	      (pred_2 ?v1 - type_1 ?v5 - object ?v7 - type_3))

   (:action op_2
       :parameters  (?v1 - type_1 ?v2 ?v3 - type_2)
       :precondition (and  (pred_4 ?v1 ?v2))
       :effect (and  (pred_4 ?v1 ?v3)
		     (not (pred_4 ?v1 ?v2))))

   (:action op_3
       :parameters (?v1 - type_1 ?v6 - object ?v8 - type_2 ?v7 - type_3)
       :precondition  (and  (pred_1 ?v6 ?v8) (pred_4 ?v1 ?v8) (pred_3 ?v1 ?v7))
       :effect (and (pred_2 ?v1 ?v6 ?v7)
		    (not (pred_1 ?v6 ?v8)) 
		    (not (pred_3 ?v1 ?v7))))

   (:action op_1
       :parameters (?v1 - type_1 ?v6 - object ?v8 - type_2 ?v7 - type_3)
       :precondition  (and  (pred_2 ?v1 ?v6 ?v7) (pred_4 ?v1 ?v8))
       :effect (and (pred_1 ?v6 ?v8)
		    (pred_3 ?v1 ?v7)
		    (not (pred_2 ?v1 ?v6 ?v7)))))