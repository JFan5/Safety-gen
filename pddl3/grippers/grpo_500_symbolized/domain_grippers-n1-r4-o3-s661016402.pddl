(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_4 ?v2 - type_1 ?v8 - type_2)
 	      (pred_1 ?v4 - object ?v8 - type_2)
	      (pred_2 ?v2 - type_1 ?v6 - type_3)
	      (pred_3 ?v2 - type_1 ?v4 - object ?v6 - type_3))

   (:action op_2
       :parameters  (?v2 - type_1 ?v3 ?v5 - type_2)
       :precondition (and  (pred_4 ?v2 ?v3))
       :effect (and  (pred_4 ?v2 ?v5)
		     (not (pred_4 ?v2 ?v3))))

   (:action op_3
       :parameters (?v2 - type_1 ?v7 - object ?v1 - type_2 ?v6 - type_3)
       :precondition  (and  (pred_1 ?v7 ?v1) (pred_4 ?v2 ?v1) (pred_2 ?v2 ?v6))
       :effect (and (pred_3 ?v2 ?v7 ?v6)
		    (not (pred_1 ?v7 ?v1)) 
		    (not (pred_2 ?v2 ?v6))))

   (:action op_1
       :parameters (?v2 - type_1 ?v7 - object ?v1 - type_2 ?v6 - type_3)
       :precondition  (and  (pred_3 ?v2 ?v7 ?v6) (pred_4 ?v2 ?v1))
       :effect (and (pred_1 ?v7 ?v1)
		    (pred_2 ?v2 ?v6)
		    (not (pred_3 ?v2 ?v7 ?v6)))))