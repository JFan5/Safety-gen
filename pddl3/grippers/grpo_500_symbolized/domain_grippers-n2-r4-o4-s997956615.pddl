(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_2 ?v6 - type_3 ?v1 - type_2)
 	      (pred_4 ?v7 - object ?v1 - type_2)
	      (pred_1 ?v6 - type_3 ?v4 - type_1)
	      (pred_3 ?v6 - type_3 ?v7 - object ?v4 - type_1))

   (:action op_3
       :parameters  (?v6 - type_3 ?v2 ?v5 - type_2)
       :precondition (and  (pred_2 ?v6 ?v2))
       :effect (and  (pred_2 ?v6 ?v5)
		     (not (pred_2 ?v6 ?v2))))

   (:action op_1
       :parameters (?v6 - type_3 ?v3 - object ?v8 - type_2 ?v4 - type_1)
       :precondition  (and  (pred_4 ?v3 ?v8) (pred_2 ?v6 ?v8) (pred_1 ?v6 ?v4))
       :effect (and (pred_3 ?v6 ?v3 ?v4)
		    (not (pred_4 ?v3 ?v8)) 
		    (not (pred_1 ?v6 ?v4))))

   (:action op_2
       :parameters (?v6 - type_3 ?v3 - object ?v8 - type_2 ?v4 - type_1)
       :precondition  (and  (pred_3 ?v6 ?v3 ?v4) (pred_2 ?v6 ?v8))
       :effect (and (pred_4 ?v3 ?v8)
		    (pred_1 ?v6 ?v4)
		    (not (pred_3 ?v6 ?v3 ?v4)))))