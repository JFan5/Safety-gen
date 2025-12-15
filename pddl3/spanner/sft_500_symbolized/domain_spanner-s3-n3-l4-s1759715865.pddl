(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_1 type_4 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v4 - type_3 ?v8 - type_5)
	(pred_1 ?v4 - type_1 ?v7 - type_2)
	(pred_6 ?v7 - type_2)
	(pred_3 ?v3 - type_5 ?v6 - type_5)
	(pred_2 ?v5 - type_4)
	(pred_5 ?v5 - type_4))                                                                                           
(:action op_1 
        :parameters (?v1 - type_5 ?v2 - type_5 ?v4 - type_1)
        :precondition (and (pred_4 ?v4 ?v1) 
                           (pred_3 ?v1 ?v2))                                                          
        :effect (and (not (pred_4 ?v4 ?v1)) (pred_4 ?v4 ?v2)))

(:action op_2 
        :parameters (?v8 - type_5 ?v7 - type_2 ?v4 - type_1)
        :precondition (and (pred_4 ?v4 ?v8) 
                           (pred_4 ?v7 ?v8))
        :effect (and (not (pred_4 ?v7 ?v8))
                     (pred_1 ?v4 ?v7)))

(:action op_3 
        :parameters (?v8 - type_5 ?v7 - type_2 ?v4 - type_1 ?v5 - type_4)
        :precondition (and (pred_4 ?v4 ?v8) 
		      	   (pred_4 ?v5 ?v8)
			   (pred_1 ?v4 ?v7)
			   (pred_6 ?v7)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_6 ?v7)) (pred_2 ?v5)))
)