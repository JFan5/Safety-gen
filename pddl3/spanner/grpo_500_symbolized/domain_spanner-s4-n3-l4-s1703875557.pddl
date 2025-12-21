(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_5 type_4 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v1 - type_3 ?v3 - type_1)
	(pred_3 ?v1 - type_5 ?v7 - type_2)
	(pred_4 ?v7 - type_2)
	(pred_1 ?v8 - type_1 ?v5 - type_1)
	(pred_6 ?v4 - type_4)
	(pred_2 ?v4 - type_4))                                                                                           
(:action op_1 
        :parameters (?v6 - type_1 ?v2 - type_1 ?v1 - type_5)
        :precondition (and (pred_5 ?v1 ?v6) 
                           (pred_1 ?v6 ?v2))                                                          
        :effect (and (not (pred_5 ?v1 ?v6)) (pred_5 ?v1 ?v2)))

(:action op_3 
        :parameters (?v3 - type_1 ?v7 - type_2 ?v1 - type_5)
        :precondition (and (pred_5 ?v1 ?v3) 
                           (pred_5 ?v7 ?v3))
        :effect (and (not (pred_5 ?v7 ?v3))
                     (pred_3 ?v1 ?v7)))

(:action op_2 
        :parameters (?v3 - type_1 ?v7 - type_2 ?v1 - type_5 ?v4 - type_4)
        :precondition (and (pred_5 ?v1 ?v3) 
		      	   (pred_5 ?v4 ?v3)
			   (pred_3 ?v1 ?v7)
			   (pred_4 ?v7)
			   (pred_2 ?v4))
        :effect (and (not (pred_2 ?v4))(not (pred_4 ?v7)) (pred_6 ?v4)))
)