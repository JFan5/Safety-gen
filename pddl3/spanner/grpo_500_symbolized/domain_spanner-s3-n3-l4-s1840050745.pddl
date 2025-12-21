(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_5 type_2 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_4 ?v1 - type_3)
	(pred_1 ?v7 - type_5 ?v2 - type_1)
	(pred_3 ?v2 - type_1)
	(pred_5 ?v5 - type_3 ?v8 - type_3)
	(pred_6 ?v4 - type_2)
	(pred_4 ?v4 - type_2))                                                                                           
(:action op_2 
        :parameters (?v6 - type_3 ?v3 - type_3 ?v7 - type_5)
        :precondition (and (pred_2 ?v7 ?v6) 
                           (pred_5 ?v6 ?v3))                                                          
        :effect (and (not (pred_2 ?v7 ?v6)) (pred_2 ?v7 ?v3)))

(:action op_1 
        :parameters (?v1 - type_3 ?v2 - type_1 ?v7 - type_5)
        :precondition (and (pred_2 ?v7 ?v1) 
                           (pred_2 ?v2 ?v1))
        :effect (and (not (pred_2 ?v2 ?v1))
                     (pred_1 ?v7 ?v2)))

(:action op_3 
        :parameters (?v1 - type_3 ?v2 - type_1 ?v7 - type_5 ?v4 - type_2)
        :precondition (and (pred_2 ?v7 ?v1) 
		      	   (pred_2 ?v4 ?v1)
			   (pred_1 ?v7 ?v2)
			   (pred_3 ?v2)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_3 ?v2)) (pred_6 ?v4)))
)