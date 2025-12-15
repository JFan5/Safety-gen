(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_1 ?v3 - type_2 ?v1 - type_1)
 	      (pred_3 ?v2 - object ?v1 - type_1)
	      (pred_4 ?v3 - type_2 ?v5 - type_3)
	      (pred_2 ?v3 - type_2 ?v2 - object ?v5 - type_3))

   (:action op_1
       :parameters  (?v3 - type_2 ?v7 ?v4 - type_1)
       :precondition (and  (pred_1 ?v3 ?v7))
       :effect (and  (pred_1 ?v3 ?v4)
		     (not (pred_1 ?v3 ?v7))))

   (:action op_2
       :parameters (?v3 - type_2 ?v8 - object ?v6 - type_1 ?v5 - type_3)
       :precondition  (and  (pred_3 ?v8 ?v6) (pred_1 ?v3 ?v6) (pred_4 ?v3 ?v5))
       :effect (and (pred_2 ?v3 ?v8 ?v5)
		    (not (pred_3 ?v8 ?v6)) 
		    (not (pred_4 ?v3 ?v5))))

   (:action op_3
       :parameters (?v3 - type_2 ?v8 - object ?v6 - type_1 ?v5 - type_3)
       :precondition  (and  (pred_2 ?v3 ?v8 ?v5) (pred_1 ?v3 ?v6))
       :effect (and (pred_3 ?v8 ?v6)
		    (pred_4 ?v3 ?v5)
		    (not (pred_2 ?v3 ?v8 ?v5)))))