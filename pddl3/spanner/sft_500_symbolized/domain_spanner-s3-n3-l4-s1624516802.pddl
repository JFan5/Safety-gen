(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_2 type_4 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_3 ?v7 - type_1)
	(pred_4 ?v3 - type_2 ?v4 - type_5)
	(pred_3 ?v4 - type_5)
	(pred_6 ?v5 - type_1 ?v8 - type_1)
	(pred_1 ?v1 - type_4)
	(pred_5 ?v1 - type_4))                                                                                           
(:action op_2 
        :parameters (?v6 - type_1 ?v2 - type_1 ?v3 - type_2)
        :precondition (and (pred_2 ?v3 ?v6) 
                           (pred_6 ?v6 ?v2))                                                          
        :effect (and (not (pred_2 ?v3 ?v6)) (pred_2 ?v3 ?v2)))

(:action op_3 
        :parameters (?v7 - type_1 ?v4 - type_5 ?v3 - type_2)
        :precondition (and (pred_2 ?v3 ?v7) 
                           (pred_2 ?v4 ?v7))
        :effect (and (not (pred_2 ?v4 ?v7))
                     (pred_4 ?v3 ?v4)))

(:action op_1 
        :parameters (?v7 - type_1 ?v4 - type_5 ?v3 - type_2 ?v1 - type_4)
        :precondition (and (pred_2 ?v3 ?v7) 
		      	   (pred_2 ?v1 ?v7)
			   (pred_4 ?v3 ?v4)
			   (pred_3 ?v4)
			   (pred_5 ?v1))
        :effect (and (not (pred_5 ?v1))(not (pred_3 ?v4)) (pred_1 ?v1)))
)