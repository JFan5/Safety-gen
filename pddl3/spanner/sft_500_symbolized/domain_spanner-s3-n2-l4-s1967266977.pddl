(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_1 type_2 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v1 - type_3 ?v4 - type_5)
	(pred_5 ?v1 - type_1 ?v7 - type_4)
	(pred_4 ?v7 - type_4)
	(pred_1 ?v6 - type_5 ?v3 - type_5)
	(pred_3 ?v5 - type_2)
	(pred_6 ?v5 - type_2))                                                                                           
(:action op_2 
        :parameters (?v2 - type_5 ?v8 - type_5 ?v1 - type_1)
        :precondition (and (pred_2 ?v1 ?v2) 
                           (pred_1 ?v2 ?v8))                                                          
        :effect (and (not (pred_2 ?v1 ?v2)) (pred_2 ?v1 ?v8)))

(:action op_1 
        :parameters (?v4 - type_5 ?v7 - type_4 ?v1 - type_1)
        :precondition (and (pred_2 ?v1 ?v4) 
                           (pred_2 ?v7 ?v4))
        :effect (and (not (pred_2 ?v7 ?v4))
                     (pred_5 ?v1 ?v7)))

(:action op_3 
        :parameters (?v4 - type_5 ?v7 - type_4 ?v1 - type_1 ?v5 - type_2)
        :precondition (and (pred_2 ?v1 ?v4) 
		      	   (pred_2 ?v5 ?v4)
			   (pred_5 ?v1 ?v7)
			   (pred_4 ?v7)
			   (pred_6 ?v5))
        :effect (and (not (pred_6 ?v5))(not (pred_4 ?v7)) (pred_3 ?v5)))
)