(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_5 type_4 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v8 - type_3 ?v5 - type_2)
	(pred_1 ?v8 - type_5 ?v7 - type_1)
	(pred_5 ?v7 - type_1)
	(pred_3 ?v3 - type_2 ?v6 - type_2)
	(pred_4 ?v1 - type_4)
	(pred_2 ?v1 - type_4))                                                                                           
(:action op_3 
        :parameters (?v4 - type_2 ?v2 - type_2 ?v8 - type_5)
        :precondition (and (pred_6 ?v8 ?v4) 
                           (pred_3 ?v4 ?v2))                                                          
        :effect (and (not (pred_6 ?v8 ?v4)) (pred_6 ?v8 ?v2)))

(:action op_1 
        :parameters (?v5 - type_2 ?v7 - type_1 ?v8 - type_5)
        :precondition (and (pred_6 ?v8 ?v5) 
                           (pred_6 ?v7 ?v5))
        :effect (and (not (pred_6 ?v7 ?v5))
                     (pred_1 ?v8 ?v7)))

(:action op_2 
        :parameters (?v5 - type_2 ?v7 - type_1 ?v8 - type_5 ?v1 - type_4)
        :precondition (and (pred_6 ?v8 ?v5) 
		      	   (pred_6 ?v1 ?v5)
			   (pred_1 ?v8 ?v7)
			   (pred_5 ?v7)
			   (pred_2 ?v1))
        :effect (and (not (pred_2 ?v1))(not (pred_5 ?v7)) (pred_4 ?v1)))
)