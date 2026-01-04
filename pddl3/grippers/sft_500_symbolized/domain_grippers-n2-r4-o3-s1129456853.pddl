(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_1 ?v2 - type_1 ?v5 - type_2)
 	      (pred_4 ?v1 - object ?v5 - type_2)
	      (pred_2 ?v2 - type_1 ?v6 - type_3)
	      (pred_3 ?v2 - type_1 ?v1 - object ?v6 - type_3))

   (:action op_3
       :parameters  (?v2 - type_1 ?v4 ?v3 - type_2)
       :precondition (and  (pred_1 ?v2 ?v4))
       :effect (and  (pred_1 ?v2 ?v3)
		     (not (pred_1 ?v2 ?v4))))

   (:action op_2
       :parameters (?v2 - type_1 ?v8 - object ?v7 - type_2 ?v6 - type_3)
       :precondition  (and  (pred_4 ?v8 ?v7) (pred_1 ?v2 ?v7) (pred_2 ?v2 ?v6))
       :effect (and (pred_3 ?v2 ?v8 ?v6)
		    (not (pred_4 ?v8 ?v7)) 
		    (not (pred_2 ?v2 ?v6))))

   (:action op_1
       :parameters (?v2 - type_1 ?v8 - object ?v7 - type_2 ?v6 - type_3)
       :precondition  (and  (pred_3 ?v2 ?v8 ?v6) (pred_1 ?v2 ?v7))
       :effect (and (pred_4 ?v8 ?v7)
		    (pred_2 ?v2 ?v6)
		    (not (pred_3 ?v2 ?v8 ?v6)))))