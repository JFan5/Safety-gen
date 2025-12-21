(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_1 type_2 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_4 ?v4 - type_3)
	(pred_1 ?v3 - type_1 ?v7 - type_5)
	(pred_6 ?v7 - type_5)
	(pred_3 ?v5 - type_3 ?v6 - type_3)
	(pred_4 ?v1 - type_2)
	(pred_5 ?v1 - type_2))                                                                                           
(:action op_2 
        :parameters (?v8 - type_3 ?v2 - type_3 ?v3 - type_1)
        :precondition (and (pred_2 ?v3 ?v8) 
                           (pred_3 ?v8 ?v2))                                                          
        :effect (and (not (pred_2 ?v3 ?v8)) (pred_2 ?v3 ?v2)))

(:action op_1 
        :parameters (?v4 - type_3 ?v7 - type_5 ?v3 - type_1)
        :precondition (and (pred_2 ?v3 ?v4) 
                           (pred_2 ?v7 ?v4))
        :effect (and (not (pred_2 ?v7 ?v4))
                     (pred_1 ?v3 ?v7)))

(:action op_3 
        :parameters (?v4 - type_3 ?v7 - type_5 ?v3 - type_1 ?v1 - type_2)
        :precondition (and (pred_2 ?v3 ?v4) 
		      	   (pred_2 ?v1 ?v4)
			   (pred_1 ?v3 ?v7)
			   (pred_6 ?v7)
			   (pred_5 ?v1))
        :effect (and (not (pred_5 ?v1))(not (pred_6 ?v7)) (pred_4 ?v1)))
)