(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_2 type_3 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v5 - type_5 ?v1 - type_1)
	(pred_2 ?v5 - type_2 ?v4 - type_4)
	(pred_3 ?v4 - type_4)
	(pred_1 ?v6 - type_1 ?v3 - type_1)
	(pred_6 ?v8 - type_3)
	(pred_4 ?v8 - type_3))                                                                                           
(:action op_3 
        :parameters (?v2 - type_1 ?v7 - type_1 ?v5 - type_2)
        :precondition (and (pred_5 ?v5 ?v2) 
                           (pred_1 ?v2 ?v7))                                                          
        :effect (and (not (pred_5 ?v5 ?v2)) (pred_5 ?v5 ?v7)))

(:action op_1 
        :parameters (?v1 - type_1 ?v4 - type_4 ?v5 - type_2)
        :precondition (and (pred_5 ?v5 ?v1) 
                           (pred_5 ?v4 ?v1))
        :effect (and (not (pred_5 ?v4 ?v1))
                     (pred_2 ?v5 ?v4)))

(:action op_2 
        :parameters (?v1 - type_1 ?v4 - type_4 ?v5 - type_2 ?v8 - type_3)
        :precondition (and (pred_5 ?v5 ?v1) 
		      	   (pred_5 ?v8 ?v1)
			   (pred_2 ?v5 ?v4)
			   (pred_3 ?v4)
			   (pred_4 ?v8))
        :effect (and (not (pred_4 ?v8))(not (pred_3 ?v4)) (pred_6 ?v8)))
)