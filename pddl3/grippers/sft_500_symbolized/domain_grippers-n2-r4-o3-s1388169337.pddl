(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_4 ?v1 - type_2 ?v3 - type_3)
 	      (pred_1 ?v2 - object ?v3 - type_3)
	      (pred_2 ?v1 - type_2 ?v6 - type_1)
	      (pred_3 ?v1 - type_2 ?v2 - object ?v6 - type_1))

   (:action op_2
       :parameters  (?v1 - type_2 ?v4 ?v7 - type_3)
       :precondition (and  (pred_4 ?v1 ?v4))
       :effect (and  (pred_4 ?v1 ?v7)
		     (not (pred_4 ?v1 ?v4))))

   (:action op_1
       :parameters (?v1 - type_2 ?v5 - object ?v8 - type_3 ?v6 - type_1)
       :precondition  (and  (pred_1 ?v5 ?v8) (pred_4 ?v1 ?v8) (pred_2 ?v1 ?v6))
       :effect (and (pred_3 ?v1 ?v5 ?v6)
		    (not (pred_1 ?v5 ?v8)) 
		    (not (pred_2 ?v1 ?v6))))

   (:action op_3
       :parameters (?v1 - type_2 ?v5 - object ?v8 - type_3 ?v6 - type_1)
       :precondition  (and  (pred_3 ?v1 ?v5 ?v6) (pred_4 ?v1 ?v8))
       :effect (and (pred_1 ?v5 ?v8)
		    (pred_2 ?v1 ?v6)
		    (not (pred_3 ?v1 ?v5 ?v6)))))