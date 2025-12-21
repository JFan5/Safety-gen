(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_1 type_5 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v4 - type_3 ?v2 - type_4)
	(pred_6 ?v4 - type_1 ?v5 - type_2)
	(pred_3 ?v5 - type_2)
	(pred_2 ?v3 - type_4 ?v6 - type_4)
	(pred_5 ?v7 - type_5)
	(pred_1 ?v7 - type_5))                                                                                           
(:action op_2 
        :parameters (?v1 - type_4 ?v8 - type_4 ?v4 - type_1)
        :precondition (and (pred_4 ?v4 ?v1) 
                           (pred_2 ?v1 ?v8))                                                          
        :effect (and (not (pred_4 ?v4 ?v1)) (pred_4 ?v4 ?v8)))

(:action op_1 
        :parameters (?v2 - type_4 ?v5 - type_2 ?v4 - type_1)
        :precondition (and (pred_4 ?v4 ?v2) 
                           (pred_4 ?v5 ?v2))
        :effect (and (not (pred_4 ?v5 ?v2))
                     (pred_6 ?v4 ?v5)))

(:action op_3 
        :parameters (?v2 - type_4 ?v5 - type_2 ?v4 - type_1 ?v7 - type_5)
        :precondition (and (pred_4 ?v4 ?v2) 
		      	   (pred_4 ?v7 ?v2)
			   (pred_6 ?v4 ?v5)
			   (pred_3 ?v5)
			   (pred_1 ?v7))
        :effect (and (not (pred_1 ?v7))(not (pred_3 ?v5)) (pred_5 ?v7)))
)