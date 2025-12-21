(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_3 type_4 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v5 - type_5 ?v4 - type_1)
	(pred_5 ?v5 - type_3 ?v1 - type_2)
	(pred_3 ?v1 - type_2)
	(pred_1 ?v3 - type_1 ?v8 - type_1)
	(pred_6 ?v7 - type_4)
	(pred_4 ?v7 - type_4))                                                                                           
(:action op_3 
        :parameters (?v6 - type_1 ?v2 - type_1 ?v5 - type_3)
        :precondition (and (pred_2 ?v5 ?v6) 
                           (pred_1 ?v6 ?v2))                                                          
        :effect (and (not (pred_2 ?v5 ?v6)) (pred_2 ?v5 ?v2)))

(:action op_1 
        :parameters (?v4 - type_1 ?v1 - type_2 ?v5 - type_3)
        :precondition (and (pred_2 ?v5 ?v4) 
                           (pred_2 ?v1 ?v4))
        :effect (and (not (pred_2 ?v1 ?v4))
                     (pred_5 ?v5 ?v1)))

(:action op_2 
        :parameters (?v4 - type_1 ?v1 - type_2 ?v5 - type_3 ?v7 - type_4)
        :precondition (and (pred_2 ?v5 ?v4) 
		      	   (pred_2 ?v7 ?v4)
			   (pred_5 ?v5 ?v1)
			   (pred_3 ?v1)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_3 ?v1)) (pred_6 ?v7)))
)