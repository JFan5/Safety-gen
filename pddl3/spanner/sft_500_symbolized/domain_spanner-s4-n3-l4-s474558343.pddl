(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_3 type_4 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_1 ?v2 - type_2)
	(pred_4 ?v8 - type_3 ?v7 - type_5)
	(pred_6 ?v7 - type_5)
	(pred_2 ?v3 - type_2 ?v5 - type_2)
	(pred_3 ?v4 - type_4)
	(pred_1 ?v4 - type_4))                                                                                           
(:action op_3 
        :parameters (?v1 - type_2 ?v6 - type_2 ?v8 - type_3)
        :precondition (and (pred_5 ?v8 ?v1) 
                           (pred_2 ?v1 ?v6))                                                          
        :effect (and (not (pred_5 ?v8 ?v1)) (pred_5 ?v8 ?v6)))

(:action op_1 
        :parameters (?v2 - type_2 ?v7 - type_5 ?v8 - type_3)
        :precondition (and (pred_5 ?v8 ?v2) 
                           (pred_5 ?v7 ?v2))
        :effect (and (not (pred_5 ?v7 ?v2))
                     (pred_4 ?v8 ?v7)))

(:action op_2 
        :parameters (?v2 - type_2 ?v7 - type_5 ?v8 - type_3 ?v4 - type_4)
        :precondition (and (pred_5 ?v8 ?v2) 
		      	   (pred_5 ?v4 ?v2)
			   (pred_4 ?v8 ?v7)
			   (pred_6 ?v7)
			   (pred_1 ?v4))
        :effect (and (not (pred_1 ?v4))(not (pred_6 ?v7)) (pred_3 ?v4)))
)