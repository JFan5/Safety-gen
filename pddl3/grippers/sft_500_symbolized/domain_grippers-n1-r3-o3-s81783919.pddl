(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_1 ?v3 - type_2 ?v4 - type_3)
 	      (pred_4 ?v8 - object ?v4 - type_3)
	      (pred_3 ?v3 - type_2 ?v2 - type_1)
	      (pred_2 ?v3 - type_2 ?v8 - object ?v2 - type_1))

   (:action op_3
       :parameters  (?v3 - type_2 ?v7 ?v5 - type_3)
       :precondition (and  (pred_1 ?v3 ?v7))
       :effect (and  (pred_1 ?v3 ?v5)
		     (not (pred_1 ?v3 ?v7))))

   (:action op_2
       :parameters (?v3 - type_2 ?v1 - object ?v6 - type_3 ?v2 - type_1)
       :precondition  (and  (pred_4 ?v1 ?v6) (pred_1 ?v3 ?v6) (pred_3 ?v3 ?v2))
       :effect (and (pred_2 ?v3 ?v1 ?v2)
		    (not (pred_4 ?v1 ?v6)) 
		    (not (pred_3 ?v3 ?v2))))

   (:action op_1
       :parameters (?v3 - type_2 ?v1 - object ?v6 - type_3 ?v2 - type_1)
       :precondition  (and  (pred_2 ?v3 ?v1 ?v2) (pred_1 ?v3 ?v6))
       :effect (and (pred_4 ?v1 ?v6)
		    (pred_3 ?v3 ?v2)
		    (not (pred_2 ?v3 ?v1 ?v2)))))