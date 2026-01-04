(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_1 ?v5 - type_2 ?v7 - type_3)
 	      (pred_4 ?v3 - object ?v7 - type_3)
	      (pred_2 ?v5 - type_2 ?v6 - type_1)
	      (pred_3 ?v5 - type_2 ?v3 - object ?v6 - type_1))

   (:action op_2
       :parameters  (?v5 - type_2 ?v1 ?v8 - type_3)
       :precondition (and  (pred_1 ?v5 ?v1))
       :effect (and  (pred_1 ?v5 ?v8)
		     (not (pred_1 ?v5 ?v1))))

   (:action op_3
       :parameters (?v5 - type_2 ?v2 - object ?v4 - type_3 ?v6 - type_1)
       :precondition  (and  (pred_4 ?v2 ?v4) (pred_1 ?v5 ?v4) (pred_2 ?v5 ?v6))
       :effect (and (pred_3 ?v5 ?v2 ?v6)
		    (not (pred_4 ?v2 ?v4)) 
		    (not (pred_2 ?v5 ?v6))))

   (:action op_1
       :parameters (?v5 - type_2 ?v2 - object ?v4 - type_3 ?v6 - type_1)
       :precondition  (and  (pred_3 ?v5 ?v2 ?v6) (pred_1 ?v5 ?v4))
       :effect (and (pred_4 ?v2 ?v4)
		    (pred_2 ?v5 ?v6)
		    (not (pred_3 ?v5 ?v2 ?v6)))))