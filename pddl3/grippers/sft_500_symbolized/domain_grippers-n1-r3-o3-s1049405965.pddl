(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_1 object type_3 type_2)
 (:predicates (pred_2 ?v2 - type_3 ?v3 - type_1)
 	      (pred_4 ?v7 - object ?v3 - type_1)
	      (pred_3 ?v2 - type_3 ?v4 - type_2)
	      (pred_1 ?v2 - type_3 ?v7 - object ?v4 - type_2))

   (:action op_1
       :parameters  (?v2 - type_3 ?v8 ?v5 - type_1)
       :precondition (and  (pred_2 ?v2 ?v8))
       :effect (and  (pred_2 ?v2 ?v5)
		     (not (pred_2 ?v2 ?v8))))

   (:action op_3
       :parameters (?v2 - type_3 ?v1 - object ?v6 - type_1 ?v4 - type_2)
       :precondition  (and  (pred_4 ?v1 ?v6) (pred_2 ?v2 ?v6) (pred_3 ?v2 ?v4))
       :effect (and (pred_1 ?v2 ?v1 ?v4)
		    (not (pred_4 ?v1 ?v6)) 
		    (not (pred_3 ?v2 ?v4))))

   (:action op_2
       :parameters (?v2 - type_3 ?v1 - object ?v6 - type_1 ?v4 - type_2)
       :precondition  (and  (pred_1 ?v2 ?v1 ?v4) (pred_2 ?v2 ?v6))
       :effect (and (pred_4 ?v1 ?v6)
		    (pred_3 ?v2 ?v4)
		    (not (pred_1 ?v2 ?v1 ?v4)))))