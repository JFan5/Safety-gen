(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_2 type_3)
 (:predicates (pred_2 ?v5 - type_2 ?v3 - type_1)
 	      (pred_3 ?v1 - object ?v3 - type_1)
	      (pred_1 ?v5 - type_2 ?v6 - type_3)
	      (pred_4 ?v5 - type_2 ?v1 - object ?v6 - type_3))

   (:action op_2
       :parameters  (?v5 - type_2 ?v7 ?v2 - type_1)
       :precondition (and  (pred_2 ?v5 ?v7))
       :effect (and  (pred_2 ?v5 ?v2)
		     (not (pred_2 ?v5 ?v7))))

   (:action op_1
       :parameters (?v5 - type_2 ?v8 - object ?v4 - type_1 ?v6 - type_3)
       :precondition  (and  (pred_3 ?v8 ?v4) (pred_2 ?v5 ?v4) (pred_1 ?v5 ?v6))
       :effect (and (pred_4 ?v5 ?v8 ?v6)
		    (not (pred_3 ?v8 ?v4)) 
		    (not (pred_1 ?v5 ?v6))))

   (:action op_3
       :parameters (?v5 - type_2 ?v8 - object ?v4 - type_1 ?v6 - type_3)
       :precondition  (and  (pred_4 ?v5 ?v8 ?v6) (pred_2 ?v5 ?v4))
       :effect (and (pred_3 ?v8 ?v4)
		    (pred_1 ?v5 ?v6)
		    (not (pred_4 ?v5 ?v8 ?v6)))))