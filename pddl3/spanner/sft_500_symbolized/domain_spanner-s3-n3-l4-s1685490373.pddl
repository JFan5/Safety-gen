(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_2 type_4 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_5 ?v2 - type_3)
	(pred_6 ?v7 - type_2 ?v3 - type_1)
	(pred_5 ?v3 - type_1)
	(pred_4 ?v5 - type_3 ?v8 - type_3)
	(pred_3 ?v4 - type_4)
	(pred_1 ?v4 - type_4))                                                                                           
(:action op_3 
        :parameters (?v6 - type_3 ?v1 - type_3 ?v7 - type_2)
        :precondition (and (pred_2 ?v7 ?v6) 
                           (pred_4 ?v6 ?v1))                                                          
        :effect (and (not (pred_2 ?v7 ?v6)) (pred_2 ?v7 ?v1)))

(:action op_1 
        :parameters (?v2 - type_3 ?v3 - type_1 ?v7 - type_2)
        :precondition (and (pred_2 ?v7 ?v2) 
                           (pred_2 ?v3 ?v2))
        :effect (and (not (pred_2 ?v3 ?v2))
                     (pred_6 ?v7 ?v3)))

(:action op_2 
        :parameters (?v2 - type_3 ?v3 - type_1 ?v7 - type_2 ?v4 - type_4)
        :precondition (and (pred_2 ?v7 ?v2) 
		      	   (pred_2 ?v4 ?v2)
			   (pred_6 ?v7 ?v3)
			   (pred_5 ?v3)
			   (pred_1 ?v4))
        :effect (and (not (pred_1 ?v4))(not (pred_5 ?v3)) (pred_3 ?v4)))
)