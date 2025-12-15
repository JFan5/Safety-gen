(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_1 type_3 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v1 - type_5 ?v3 - type_4)
	(pred_1 ?v1 - type_1 ?v4 - type_2)
	(pred_3 ?v4 - type_2)
	(pred_6 ?v8 - type_4 ?v5 - type_4)
	(pred_4 ?v7 - type_3)
	(pred_2 ?v7 - type_3))                                                                                           
(:action op_3 
        :parameters (?v6 - type_4 ?v2 - type_4 ?v1 - type_1)
        :precondition (and (pred_5 ?v1 ?v6) 
                           (pred_6 ?v6 ?v2))                                                          
        :effect (and (not (pred_5 ?v1 ?v6)) (pred_5 ?v1 ?v2)))

(:action op_2 
        :parameters (?v3 - type_4 ?v4 - type_2 ?v1 - type_1)
        :precondition (and (pred_5 ?v1 ?v3) 
                           (pred_5 ?v4 ?v3))
        :effect (and (not (pred_5 ?v4 ?v3))
                     (pred_1 ?v1 ?v4)))

(:action op_1 
        :parameters (?v3 - type_4 ?v4 - type_2 ?v1 - type_1 ?v7 - type_3)
        :precondition (and (pred_5 ?v1 ?v3) 
		      	   (pred_5 ?v7 ?v3)
			   (pred_1 ?v1 ?v4)
			   (pred_3 ?v4)
			   (pred_2 ?v7))
        :effect (and (not (pred_2 ?v7))(not (pred_3 ?v4)) (pred_4 ?v7)))
)