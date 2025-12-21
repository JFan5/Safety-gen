(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_5 type_2 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v2 - type_4 ?v7 - type_1)
	(pred_1 ?v2 - type_5 ?v1 - type_3)
	(pred_4 ?v1 - type_3)
	(pred_5 ?v3 - type_1 ?v8 - type_1)
	(pred_3 ?v4 - type_2)
	(pred_2 ?v4 - type_2))                                                                                           
(:action op_3 
        :parameters (?v6 - type_1 ?v5 - type_1 ?v2 - type_5)
        :precondition (and (pred_6 ?v2 ?v6) 
                           (pred_5 ?v6 ?v5))                                                          
        :effect (and (not (pred_6 ?v2 ?v6)) (pred_6 ?v2 ?v5)))

(:action op_2 
        :parameters (?v7 - type_1 ?v1 - type_3 ?v2 - type_5)
        :precondition (and (pred_6 ?v2 ?v7) 
                           (pred_6 ?v1 ?v7))
        :effect (and (not (pred_6 ?v1 ?v7))
                     (pred_1 ?v2 ?v1)))

(:action op_1 
        :parameters (?v7 - type_1 ?v1 - type_3 ?v2 - type_5 ?v4 - type_2)
        :precondition (and (pred_6 ?v2 ?v7) 
		      	   (pred_6 ?v4 ?v7)
			   (pred_1 ?v2 ?v1)
			   (pred_4 ?v1)
			   (pred_2 ?v4))
        :effect (and (not (pred_2 ?v4))(not (pred_4 ?v1)) (pred_3 ?v4)))
)