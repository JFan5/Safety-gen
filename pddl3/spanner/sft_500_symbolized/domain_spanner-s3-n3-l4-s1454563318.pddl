(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_3 type_2 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v3 - type_1 ?v7 - type_4)
	(pred_4 ?v3 - type_3 ?v4 - type_5)
	(pred_1 ?v4 - type_5)
	(pred_6 ?v5 - type_4 ?v6 - type_4)
	(pred_2 ?v2 - type_2)
	(pred_3 ?v2 - type_2))                                                                                           
(:action op_2 
        :parameters (?v1 - type_4 ?v8 - type_4 ?v3 - type_3)
        :precondition (and (pred_5 ?v3 ?v1) 
                           (pred_6 ?v1 ?v8))                                                          
        :effect (and (not (pred_5 ?v3 ?v1)) (pred_5 ?v3 ?v8)))

(:action op_3 
        :parameters (?v7 - type_4 ?v4 - type_5 ?v3 - type_3)
        :precondition (and (pred_5 ?v3 ?v7) 
                           (pred_5 ?v4 ?v7))
        :effect (and (not (pred_5 ?v4 ?v7))
                     (pred_4 ?v3 ?v4)))

(:action op_1 
        :parameters (?v7 - type_4 ?v4 - type_5 ?v3 - type_3 ?v2 - type_2)
        :precondition (and (pred_5 ?v3 ?v7) 
		      	   (pred_5 ?v2 ?v7)
			   (pred_4 ?v3 ?v4)
			   (pred_1 ?v4)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_1 ?v4)) (pred_2 ?v2)))
)