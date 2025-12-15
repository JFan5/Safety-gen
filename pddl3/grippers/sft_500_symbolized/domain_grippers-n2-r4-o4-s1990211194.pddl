(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_3 ?v6 - type_1 ?v2 - type_2)
 	      (pred_4 ?v3 - object ?v2 - type_2)
	      (pred_1 ?v6 - type_1 ?v4 - type_3)
	      (pred_2 ?v6 - type_1 ?v3 - object ?v4 - type_3))

   (:action op_1
       :parameters  (?v6 - type_1 ?v7 ?v8 - type_2)
       :precondition (and  (pred_3 ?v6 ?v7))
       :effect (and  (pred_3 ?v6 ?v8)
		     (not (pred_3 ?v6 ?v7))))

   (:action op_3
       :parameters (?v6 - type_1 ?v5 - object ?v1 - type_2 ?v4 - type_3)
       :precondition  (and  (pred_4 ?v5 ?v1) (pred_3 ?v6 ?v1) (pred_1 ?v6 ?v4))
       :effect (and (pred_2 ?v6 ?v5 ?v4)
		    (not (pred_4 ?v5 ?v1)) 
		    (not (pred_1 ?v6 ?v4))))

   (:action op_2
       :parameters (?v6 - type_1 ?v5 - object ?v1 - type_2 ?v4 - type_3)
       :precondition  (and  (pred_2 ?v6 ?v5 ?v4) (pred_3 ?v6 ?v1))
       :effect (and (pred_4 ?v5 ?v1)
		    (pred_1 ?v6 ?v4)
		    (not (pred_2 ?v6 ?v5 ?v4)))))