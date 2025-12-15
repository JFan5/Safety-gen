(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_2 type_5 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v1 - type_1 ?v5 - type_4)
	(pred_3 ?v1 - type_2 ?v7 - type_3)
	(pred_6 ?v7 - type_3)
	(pred_5 ?v3 - type_4 ?v6 - type_4)
	(pred_4 ?v2 - type_5)
	(pred_2 ?v2 - type_5))                                                                                           
(:action op_3 
        :parameters (?v4 - type_4 ?v8 - type_4 ?v1 - type_2)
        :precondition (and (pred_1 ?v1 ?v4) 
                           (pred_5 ?v4 ?v8))                                                          
        :effect (and (not (pred_1 ?v1 ?v4)) (pred_1 ?v1 ?v8)))

(:action op_2 
        :parameters (?v5 - type_4 ?v7 - type_3 ?v1 - type_2)
        :precondition (and (pred_1 ?v1 ?v5) 
                           (pred_1 ?v7 ?v5))
        :effect (and (not (pred_1 ?v7 ?v5))
                     (pred_3 ?v1 ?v7)))

(:action op_1 
        :parameters (?v5 - type_4 ?v7 - type_3 ?v1 - type_2 ?v2 - type_5)
        :precondition (and (pred_1 ?v1 ?v5) 
		      	   (pred_1 ?v2 ?v5)
			   (pred_3 ?v1 ?v7)
			   (pred_6 ?v7)
			   (pred_2 ?v2))
        :effect (and (not (pred_2 ?v2))(not (pred_6 ?v7)) (pred_4 ?v2)))
)