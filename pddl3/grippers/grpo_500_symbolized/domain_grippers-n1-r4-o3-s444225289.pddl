(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_1 ?v3 - type_3 ?v5 - type_2)
 	      (pred_3 ?v1 - object ?v5 - type_2)
	      (pred_4 ?v3 - type_3 ?v6 - type_1)
	      (pred_2 ?v3 - type_3 ?v1 - object ?v6 - type_1))

   (:action op_2
       :parameters  (?v3 - type_3 ?v4 ?v2 - type_2)
       :precondition (and  (pred_1 ?v3 ?v4))
       :effect (and  (pred_1 ?v3 ?v2)
		     (not (pred_1 ?v3 ?v4))))

   (:action op_3
       :parameters (?v3 - type_3 ?v8 - object ?v7 - type_2 ?v6 - type_1)
       :precondition  (and  (pred_3 ?v8 ?v7) (pred_1 ?v3 ?v7) (pred_4 ?v3 ?v6))
       :effect (and (pred_2 ?v3 ?v8 ?v6)
		    (not (pred_3 ?v8 ?v7)) 
		    (not (pred_4 ?v3 ?v6))))

   (:action op_1
       :parameters (?v3 - type_3 ?v8 - object ?v7 - type_2 ?v6 - type_1)
       :precondition  (and  (pred_2 ?v3 ?v8 ?v6) (pred_1 ?v3 ?v7))
       :effect (and (pred_3 ?v8 ?v7)
		    (pred_4 ?v3 ?v6)
		    (not (pred_2 ?v3 ?v8 ?v6)))))