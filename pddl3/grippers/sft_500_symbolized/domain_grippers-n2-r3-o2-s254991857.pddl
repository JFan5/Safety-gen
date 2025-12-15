(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_3 type_1)
 (:predicates (pred_1 ?v8 - type_3 ?v5 - type_2)
 	      (pred_2 ?v2 - object ?v5 - type_2)
	      (pred_4 ?v8 - type_3 ?v6 - type_1)
	      (pred_3 ?v8 - type_3 ?v2 - object ?v6 - type_1))

   (:action op_2
       :parameters  (?v8 - type_3 ?v7 ?v1 - type_2)
       :precondition (and  (pred_1 ?v8 ?v7))
       :effect (and  (pred_1 ?v8 ?v1)
		     (not (pred_1 ?v8 ?v7))))

   (:action op_3
       :parameters (?v8 - type_3 ?v4 - object ?v3 - type_2 ?v6 - type_1)
       :precondition  (and  (pred_2 ?v4 ?v3) (pred_1 ?v8 ?v3) (pred_4 ?v8 ?v6))
       :effect (and (pred_3 ?v8 ?v4 ?v6)
		    (not (pred_2 ?v4 ?v3)) 
		    (not (pred_4 ?v8 ?v6))))

   (:action op_1
       :parameters (?v8 - type_3 ?v4 - object ?v3 - type_2 ?v6 - type_1)
       :precondition  (and  (pred_3 ?v8 ?v4 ?v6) (pred_1 ?v8 ?v3))
       :effect (and (pred_2 ?v4 ?v3)
		    (pred_4 ?v8 ?v6)
		    (not (pred_3 ?v8 ?v4 ?v6)))))