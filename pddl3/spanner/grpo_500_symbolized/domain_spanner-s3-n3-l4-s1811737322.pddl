(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_2 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v8 - type_3 ?v2 - type_1)
	(pred_4 ?v8 - type_2 ?v7 - type_4)
	(pred_3 ?v7 - type_4)
	(pred_6 ?v3 - type_1 ?v6 - type_1)
	(pred_1 ?v5 - type_5)
	(pred_5 ?v5 - type_5))                                                                                           
(:action op_3 
        :parameters (?v1 - type_1 ?v4 - type_1 ?v8 - type_2)
        :precondition (and (pred_2 ?v8 ?v1) 
                           (pred_6 ?v1 ?v4))                                                          
        :effect (and (not (pred_2 ?v8 ?v1)) (pred_2 ?v8 ?v4)))

(:action op_2 
        :parameters (?v2 - type_1 ?v7 - type_4 ?v8 - type_2)
        :precondition (and (pred_2 ?v8 ?v2) 
                           (pred_2 ?v7 ?v2))
        :effect (and (not (pred_2 ?v7 ?v2))
                     (pred_4 ?v8 ?v7)))

(:action op_1 
        :parameters (?v2 - type_1 ?v7 - type_4 ?v8 - type_2 ?v5 - type_5)
        :precondition (and (pred_2 ?v8 ?v2) 
		      	   (pred_2 ?v5 ?v2)
			   (pred_4 ?v8 ?v7)
			   (pred_3 ?v7)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_3 ?v7)) (pred_1 ?v5)))
)