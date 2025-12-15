(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_4 ?v5 - type_3 ?v1 - type_2)
 	      (pred_1 ?v8 - object ?v1 - type_2)
	      (pred_2 ?v5 - type_3 ?v6 - type_1)
	      (pred_3 ?v5 - type_3 ?v8 - object ?v6 - type_1))

   (:action op_3
       :parameters  (?v5 - type_3 ?v7 ?v3 - type_2)
       :precondition (and  (pred_4 ?v5 ?v7))
       :effect (and  (pred_4 ?v5 ?v3)
		     (not (pred_4 ?v5 ?v7))))

   (:action op_2
       :parameters (?v5 - type_3 ?v2 - object ?v4 - type_2 ?v6 - type_1)
       :precondition  (and  (pred_1 ?v2 ?v4) (pred_4 ?v5 ?v4) (pred_2 ?v5 ?v6))
       :effect (and (pred_3 ?v5 ?v2 ?v6)
		    (not (pred_1 ?v2 ?v4)) 
		    (not (pred_2 ?v5 ?v6))))

   (:action op_1
       :parameters (?v5 - type_3 ?v2 - object ?v4 - type_2 ?v6 - type_1)
       :precondition  (and  (pred_3 ?v5 ?v2 ?v6) (pred_4 ?v5 ?v4))
       :effect (and (pred_1 ?v2 ?v4)
		    (pred_2 ?v5 ?v6)
		    (not (pred_3 ?v5 ?v2 ?v6)))))