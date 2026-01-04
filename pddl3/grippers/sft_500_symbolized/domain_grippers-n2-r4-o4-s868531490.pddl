(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_2 ?v6 - type_3 ?v5 - type_1)
 	      (pred_3 ?v2 - object ?v5 - type_1)
	      (pred_4 ?v6 - type_3 ?v7 - type_2)
	      (pred_1 ?v6 - type_3 ?v2 - object ?v7 - type_2))

   (:action op_3
       :parameters  (?v6 - type_3 ?v8 ?v4 - type_1)
       :precondition (and  (pred_2 ?v6 ?v8))
       :effect (and  (pred_2 ?v6 ?v4)
		     (not (pred_2 ?v6 ?v8))))

   (:action op_1
       :parameters (?v6 - type_3 ?v3 - object ?v1 - type_1 ?v7 - type_2)
       :precondition  (and  (pred_3 ?v3 ?v1) (pred_2 ?v6 ?v1) (pred_4 ?v6 ?v7))
       :effect (and (pred_1 ?v6 ?v3 ?v7)
		    (not (pred_3 ?v3 ?v1)) 
		    (not (pred_4 ?v6 ?v7))))

   (:action op_2
       :parameters (?v6 - type_3 ?v3 - object ?v1 - type_1 ?v7 - type_2)
       :precondition  (and  (pred_1 ?v6 ?v3 ?v7) (pred_2 ?v6 ?v1))
       :effect (and (pred_3 ?v3 ?v1)
		    (pred_4 ?v6 ?v7)
		    (not (pred_1 ?v6 ?v3 ?v7)))))