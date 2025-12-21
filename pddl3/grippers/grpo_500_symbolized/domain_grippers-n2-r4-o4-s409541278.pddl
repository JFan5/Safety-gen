(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_2 ?v6 - type_1 ?v1 - type_2)
 	      (pred_1 ?v8 - object ?v1 - type_2)
	      (pred_4 ?v6 - type_1 ?v3 - type_3)
	      (pred_3 ?v6 - type_1 ?v8 - object ?v3 - type_3))

   (:action op_1
       :parameters  (?v6 - type_1 ?v4 ?v7 - type_2)
       :precondition (and  (pred_2 ?v6 ?v4))
       :effect (and  (pred_2 ?v6 ?v7)
		     (not (pred_2 ?v6 ?v4))))

   (:action op_2
       :parameters (?v6 - type_1 ?v2 - object ?v5 - type_2 ?v3 - type_3)
       :precondition  (and  (pred_1 ?v2 ?v5) (pred_2 ?v6 ?v5) (pred_4 ?v6 ?v3))
       :effect (and (pred_3 ?v6 ?v2 ?v3)
		    (not (pred_1 ?v2 ?v5)) 
		    (not (pred_4 ?v6 ?v3))))

   (:action op_3
       :parameters (?v6 - type_1 ?v2 - object ?v5 - type_2 ?v3 - type_3)
       :precondition  (and  (pred_3 ?v6 ?v2 ?v3) (pred_2 ?v6 ?v5))
       :effect (and (pred_1 ?v2 ?v5)
		    (pred_4 ?v6 ?v3)
		    (not (pred_3 ?v6 ?v2 ?v3)))))