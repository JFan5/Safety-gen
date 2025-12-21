(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_4 ?v3 - type_2 ?v7 - type_1)
 	      (pred_3 ?v2 - object ?v7 - type_1)
	      (pred_2 ?v3 - type_2 ?v6 - type_3)
	      (pred_1 ?v3 - type_2 ?v2 - object ?v6 - type_3))

   (:action op_3
       :parameters  (?v3 - type_2 ?v5 ?v1 - type_1)
       :precondition (and  (pred_4 ?v3 ?v5))
       :effect (and  (pred_4 ?v3 ?v1)
		     (not (pred_4 ?v3 ?v5))))

   (:action op_1
       :parameters (?v3 - type_2 ?v4 - object ?v8 - type_1 ?v6 - type_3)
       :precondition  (and  (pred_3 ?v4 ?v8) (pred_4 ?v3 ?v8) (pred_2 ?v3 ?v6))
       :effect (and (pred_1 ?v3 ?v4 ?v6)
		    (not (pred_3 ?v4 ?v8)) 
		    (not (pred_2 ?v3 ?v6))))

   (:action op_2
       :parameters (?v3 - type_2 ?v4 - object ?v8 - type_1 ?v6 - type_3)
       :precondition  (and  (pred_1 ?v3 ?v4 ?v6) (pred_4 ?v3 ?v8))
       :effect (and (pred_3 ?v4 ?v8)
		    (pred_2 ?v3 ?v6)
		    (not (pred_1 ?v3 ?v4 ?v6)))))