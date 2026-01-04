(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_4 ?v1 - type_1 ?v7 - type_3)
 	      (pred_1 ?v8 - object ?v7 - type_3)
	      (pred_2 ?v1 - type_1 ?v2 - type_2)
	      (pred_3 ?v1 - type_1 ?v8 - object ?v2 - type_2))

   (:action op_1
       :parameters  (?v1 - type_1 ?v3 ?v5 - type_3)
       :precondition (and  (pred_4 ?v1 ?v3))
       :effect (and  (pred_4 ?v1 ?v5)
		     (not (pred_4 ?v1 ?v3))))

   (:action op_2
       :parameters (?v1 - type_1 ?v6 - object ?v4 - type_3 ?v2 - type_2)
       :precondition  (and  (pred_1 ?v6 ?v4) (pred_4 ?v1 ?v4) (pred_2 ?v1 ?v2))
       :effect (and (pred_3 ?v1 ?v6 ?v2)
		    (not (pred_1 ?v6 ?v4)) 
		    (not (pred_2 ?v1 ?v2))))

   (:action op_3
       :parameters (?v1 - type_1 ?v6 - object ?v4 - type_3 ?v2 - type_2)
       :precondition  (and  (pred_3 ?v1 ?v6 ?v2) (pred_4 ?v1 ?v4))
       :effect (and (pred_1 ?v6 ?v4)
		    (pred_2 ?v1 ?v2)
		    (not (pred_3 ?v1 ?v6 ?v2)))))