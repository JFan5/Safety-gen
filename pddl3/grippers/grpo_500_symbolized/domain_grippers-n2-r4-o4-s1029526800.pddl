(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_1 ?v8 - type_2 ?v2 - type_3)
 	      (pred_3 ?v1 - object ?v2 - type_3)
	      (pred_4 ?v8 - type_2 ?v6 - type_1)
	      (pred_2 ?v8 - type_2 ?v1 - object ?v6 - type_1))

   (:action op_2
       :parameters  (?v8 - type_2 ?v4 ?v7 - type_3)
       :precondition (and  (pred_1 ?v8 ?v4))
       :effect (and  (pred_1 ?v8 ?v7)
		     (not (pred_1 ?v8 ?v4))))

   (:action op_1
       :parameters (?v8 - type_2 ?v5 - object ?v3 - type_3 ?v6 - type_1)
       :precondition  (and  (pred_3 ?v5 ?v3) (pred_1 ?v8 ?v3) (pred_4 ?v8 ?v6))
       :effect (and (pred_2 ?v8 ?v5 ?v6)
		    (not (pred_3 ?v5 ?v3)) 
		    (not (pred_4 ?v8 ?v6))))

   (:action op_3
       :parameters (?v8 - type_2 ?v5 - object ?v3 - type_3 ?v6 - type_1)
       :precondition  (and  (pred_2 ?v8 ?v5 ?v6) (pred_1 ?v8 ?v3))
       :effect (and (pred_3 ?v5 ?v3)
		    (pred_4 ?v8 ?v6)
		    (not (pred_2 ?v8 ?v5 ?v6)))))