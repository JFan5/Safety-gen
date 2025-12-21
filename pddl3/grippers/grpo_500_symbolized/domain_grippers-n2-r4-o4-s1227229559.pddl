(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_1 type_2)
 (:predicates (pred_4 ?v3 - type_1 ?v1 - type_3)
 	      (pred_3 ?v2 - object ?v1 - type_3)
	      (pred_2 ?v3 - type_1 ?v6 - type_2)
	      (pred_1 ?v3 - type_1 ?v2 - object ?v6 - type_2))

   (:action op_2
       :parameters  (?v3 - type_1 ?v4 ?v5 - type_3)
       :precondition (and  (pred_4 ?v3 ?v4))
       :effect (and  (pred_4 ?v3 ?v5)
		     (not (pred_4 ?v3 ?v4))))

   (:action op_3
       :parameters (?v3 - type_1 ?v7 - object ?v8 - type_3 ?v6 - type_2)
       :precondition  (and  (pred_3 ?v7 ?v8) (pred_4 ?v3 ?v8) (pred_2 ?v3 ?v6))
       :effect (and (pred_1 ?v3 ?v7 ?v6)
		    (not (pred_3 ?v7 ?v8)) 
		    (not (pred_2 ?v3 ?v6))))

   (:action op_1
       :parameters (?v3 - type_1 ?v7 - object ?v8 - type_3 ?v6 - type_2)
       :precondition  (and  (pred_1 ?v3 ?v7 ?v6) (pred_4 ?v3 ?v8))
       :effect (and (pred_3 ?v7 ?v8)
		    (pred_2 ?v3 ?v6)
		    (not (pred_1 ?v3 ?v7 ?v6)))))