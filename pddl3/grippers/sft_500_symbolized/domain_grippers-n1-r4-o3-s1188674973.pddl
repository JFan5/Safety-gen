(define (domain gripper-strips)
 (:requirements :strips :typing :constraints) 
 (:types type_2 object type_1 type_3)
 (:predicates (pred_2 ?v8 - type_1 ?v2 - type_2)
 	      (pred_4 ?v7 - object ?v2 - type_2)
	      (pred_1 ?v8 - type_1 ?v6 - type_3)
	      (pred_3 ?v8 - type_1 ?v7 - object ?v6 - type_3))

   (:action op_1
       :parameters  (?v8 - type_1 ?v1 ?v4 - type_2)
       :precondition (and  (pred_2 ?v8 ?v1))
       :effect (and  (pred_2 ?v8 ?v4)
		     (not (pred_2 ?v8 ?v1))))

   (:action op_3
       :parameters (?v8 - type_1 ?v3 - object ?v5 - type_2 ?v6 - type_3)
       :precondition  (and  (pred_4 ?v3 ?v5) (pred_2 ?v8 ?v5) (pred_1 ?v8 ?v6))
       :effect (and (pred_3 ?v8 ?v3 ?v6)
		    (not (pred_4 ?v3 ?v5)) 
		    (not (pred_1 ?v8 ?v6))))

   (:action op_2
       :parameters (?v8 - type_1 ?v3 - object ?v5 - type_2 ?v6 - type_3)
       :precondition  (and  (pred_3 ?v8 ?v3 ?v6) (pred_2 ?v8 ?v5))
       :effect (and (pred_4 ?v3 ?v5)
		    (pred_1 ?v8 ?v6)
		    (not (pred_3 ?v8 ?v3 ?v6)))))