(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_1 type_4 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v3 - type_3 ?v5 - type_2)
	(pred_1 ?v3 - type_1 ?v4 - type_5)
	(pred_4 ?v4 - type_5)
	(pred_3 ?v7 - type_2 ?v8 - type_2)
	(pred_2 ?v2 - type_4)
	(pred_6 ?v2 - type_4))                                                                                           
(:action op_3 
        :parameters (?v6 - type_2 ?v1 - type_2 ?v3 - type_1)
        :precondition (and (pred_5 ?v3 ?v6) 
                           (pred_3 ?v6 ?v1))                                                          
        :effect (and (not (pred_5 ?v3 ?v6)) (pred_5 ?v3 ?v1)))

(:action op_2 
        :parameters (?v5 - type_2 ?v4 - type_5 ?v3 - type_1)
        :precondition (and (pred_5 ?v3 ?v5) 
                           (pred_5 ?v4 ?v5))
        :effect (and (not (pred_5 ?v4 ?v5))
                     (pred_1 ?v3 ?v4)))

(:action op_1 
        :parameters (?v5 - type_2 ?v4 - type_5 ?v3 - type_1 ?v2 - type_4)
        :precondition (and (pred_5 ?v3 ?v5) 
		      	   (pred_5 ?v2 ?v5)
			   (pred_1 ?v3 ?v4)
			   (pred_4 ?v4)
			   (pred_6 ?v2))
        :effect (and (not (pred_6 ?v2))(not (pred_4 ?v4)) (pred_2 ?v2)))
)