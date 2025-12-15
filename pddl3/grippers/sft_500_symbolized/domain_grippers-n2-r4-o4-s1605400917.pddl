(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_1 ?v6 - type_2 ?v2 - type_3)
 	      (pred_2 ?v7 - object ?v2 - type_3)
	      (pred_4 ?v6 - type_2 ?v8 - type_1)
	      (pred_3 ?v6 - type_2 ?v7 - object ?v8 - type_1))

   (:action op_2
       :parameters  (?v6 - type_2 ?v4 ?v1 - type_3)
       :precondition (and  (pred_1 ?v6 ?v4))
       :effect (and  (pred_1 ?v6 ?v1)
		     (not (pred_1 ?v6 ?v4))))

   (:action op_1
       :parameters (?v6 - type_2 ?v3 - object ?v5 - type_3 ?v8 - type_1)
       :precondition  (and  (pred_2 ?v3 ?v5) (pred_1 ?v6 ?v5) (pred_4 ?v6 ?v8))
       :effect (and (pred_3 ?v6 ?v3 ?v8)
		    (not (pred_2 ?v3 ?v5)) 
		    (not (pred_4 ?v6 ?v8))))

   (:action op_3
       :parameters (?v6 - type_2 ?v3 - object ?v5 - type_3 ?v8 - type_1)
       :precondition  (and  (pred_3 ?v6 ?v3 ?v8) (pred_1 ?v6 ?v5))
       :effect (and (pred_2 ?v3 ?v5)
		    (pred_4 ?v6 ?v8)
		    (not (pred_3 ?v6 ?v3 ?v8)))))