(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_1 type_3 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_4 ?v2 - type_2)
	(pred_3 ?v7 - type_1 ?v1 - type_5)
	(pred_5 ?v1 - type_5)
	(pred_4 ?v6 - type_2 ?v5 - type_2)
	(pred_6 ?v3 - type_3)
	(pred_1 ?v3 - type_3))                                                                                           
(:action op_2 
        :parameters (?v4 - type_2 ?v8 - type_2 ?v7 - type_1)
        :precondition (and (pred_2 ?v7 ?v4) 
                           (pred_4 ?v4 ?v8))                                                          
        :effect (and (not (pred_2 ?v7 ?v4)) (pred_2 ?v7 ?v8)))

(:action op_3 
        :parameters (?v2 - type_2 ?v1 - type_5 ?v7 - type_1)
        :precondition (and (pred_2 ?v7 ?v2) 
                           (pred_2 ?v1 ?v2))
        :effect (and (not (pred_2 ?v1 ?v2))
                     (pred_3 ?v7 ?v1)))

(:action op_1 
        :parameters (?v2 - type_2 ?v1 - type_5 ?v7 - type_1 ?v3 - type_3)
        :precondition (and (pred_2 ?v7 ?v2) 
		      	   (pred_2 ?v3 ?v2)
			   (pred_3 ?v7 ?v1)
			   (pred_5 ?v1)
			   (pred_1 ?v3))
        :effect (and (not (pred_1 ?v3))(not (pred_5 ?v1)) (pred_6 ?v3)))
)