(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_4 ?v3 - type_1 ?v1 - type_2)
 	      (pred_3 ?v7 - object ?v1 - type_2)
	      (pred_1 ?v3 - type_1 ?v4 - type_3)
	      (pred_2 ?v3 - type_1 ?v7 - object ?v4 - type_3))

   (:action op_3
       :parameters  (?v3 - type_1 ?v8 ?v2 - type_2)
       :precondition (and  (pred_4 ?v3 ?v8))
       :effect (and  (pred_4 ?v3 ?v2)
		     (not (pred_4 ?v3 ?v8))))

   (:action op_1
       :parameters (?v3 - type_1 ?v5 - object ?v6 - type_2 ?v4 - type_3)
       :precondition  (and  (pred_3 ?v5 ?v6) (pred_4 ?v3 ?v6) (pred_1 ?v3 ?v4))
       :effect (and (pred_2 ?v3 ?v5 ?v4)
		    (not (pred_3 ?v5 ?v6)) 
		    (not (pred_1 ?v3 ?v4))))

   (:action op_2
       :parameters (?v3 - type_1 ?v5 - object ?v6 - type_2 ?v4 - type_3)
       :precondition  (and  (pred_2 ?v3 ?v5 ?v4) (pred_4 ?v3 ?v6))
       :effect (and (pred_3 ?v5 ?v6)
		    (pred_1 ?v3 ?v4)
		    (not (pred_2 ?v3 ?v5 ?v4)))))