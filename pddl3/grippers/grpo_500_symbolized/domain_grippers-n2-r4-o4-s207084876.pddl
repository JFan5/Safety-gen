(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_4 ?v8 - type_1 ?v5 - type_2)
 	      (pred_3 ?v2 - object ?v5 - type_2)
	      (pred_1 ?v8 - type_1 ?v3 - type_3)
	      (pred_2 ?v8 - type_1 ?v2 - object ?v3 - type_3))

   (:action op_3
       :parameters  (?v8 - type_1 ?v1 ?v4 - type_2)
       :precondition (and  (pred_4 ?v8 ?v1))
       :effect (and  (pred_4 ?v8 ?v4)
		     (not (pred_4 ?v8 ?v1))))

   (:action op_1
       :parameters (?v8 - type_1 ?v6 - object ?v7 - type_2 ?v3 - type_3)
       :precondition  (and  (pred_3 ?v6 ?v7) (pred_4 ?v8 ?v7) (pred_1 ?v8 ?v3))
       :effect (and (pred_2 ?v8 ?v6 ?v3)
		    (not (pred_3 ?v6 ?v7)) 
		    (not (pred_1 ?v8 ?v3))))

   (:action op_2
       :parameters (?v8 - type_1 ?v6 - object ?v7 - type_2 ?v3 - type_3)
       :precondition  (and  (pred_2 ?v8 ?v6 ?v3) (pred_4 ?v8 ?v7))
       :effect (and (pred_3 ?v6 ?v7)
		    (pred_1 ?v8 ?v3)
		    (not (pred_2 ?v8 ?v6 ?v3)))))