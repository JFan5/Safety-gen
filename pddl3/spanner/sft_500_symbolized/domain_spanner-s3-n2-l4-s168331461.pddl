(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_4 type_2 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v5 - type_3 ?v2 - type_1)
	(pred_5 ?v5 - type_4 ?v1 - type_5)
	(pred_3 ?v1 - type_5)
	(pred_6 ?v8 - type_1 ?v6 - type_1)
	(pred_1 ?v4 - type_2)
	(pred_4 ?v4 - type_2))                                                                                           
(:action op_3 
        :parameters (?v7 - type_1 ?v3 - type_1 ?v5 - type_4)
        :precondition (and (pred_2 ?v5 ?v7) 
                           (pred_6 ?v7 ?v3))                                                          
        :effect (and (not (pred_2 ?v5 ?v7)) (pred_2 ?v5 ?v3)))

(:action op_1 
        :parameters (?v2 - type_1 ?v1 - type_5 ?v5 - type_4)
        :precondition (and (pred_2 ?v5 ?v2) 
                           (pred_2 ?v1 ?v2))
        :effect (and (not (pred_2 ?v1 ?v2))
                     (pred_5 ?v5 ?v1)))

(:action op_2 
        :parameters (?v2 - type_1 ?v1 - type_5 ?v5 - type_4 ?v4 - type_2)
        :precondition (and (pred_2 ?v5 ?v2) 
		      	   (pred_2 ?v4 ?v2)
			   (pred_5 ?v5 ?v1)
			   (pred_3 ?v1)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_3 ?v1)) (pred_1 ?v4)))
)