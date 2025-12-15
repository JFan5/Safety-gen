(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_3 object type_2 type_1)
 (:predicates (pred_1 ?v1 - type_2 ?v2 - type_3)
 	      (pred_4 ?v5 - object ?v2 - type_3)
	      (pred_3 ?v1 - type_2 ?v7 - type_1)
	      (pred_2 ?v1 - type_2 ?v5 - object ?v7 - type_1))

   (:action op_2
       :parameters  (?v1 - type_2 ?v3 ?v4 - type_3)
       :precondition (and  (pred_1 ?v1 ?v3))
       :effect (and  (pred_1 ?v1 ?v4)
		     (not (pred_1 ?v1 ?v3))))

   (:action op_3
       :parameters (?v1 - type_2 ?v8 - object ?v6 - type_3 ?v7 - type_1)
       :precondition  (and  (pred_4 ?v8 ?v6) (pred_1 ?v1 ?v6) (pred_3 ?v1 ?v7))
       :effect (and (pred_2 ?v1 ?v8 ?v7)
		    (not (pred_4 ?v8 ?v6)) 
		    (not (pred_3 ?v1 ?v7))))

   (:action op_1
       :parameters (?v1 - type_2 ?v8 - object ?v6 - type_3 ?v7 - type_1)
       :precondition  (and  (pred_2 ?v1 ?v8 ?v7) (pred_1 ?v1 ?v6))
       :effect (and (pred_4 ?v8 ?v6)
		    (pred_3 ?v1 ?v7)
		    (not (pred_2 ?v1 ?v8 ?v7)))))