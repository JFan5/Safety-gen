(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_4 type_2 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_3 ?v8 - type_5)
	(pred_5 ?v3 - type_4 ?v7 - type_1)
	(pred_6 ?v7 - type_1)
	(pred_3 ?v4 - type_5 ?v5 - type_5)
	(pred_1 ?v2 - type_2)
	(pred_4 ?v2 - type_2))                                                                                           
(:action op_1 
        :parameters (?v1 - type_5 ?v6 - type_5 ?v3 - type_4)
        :precondition (and (pred_2 ?v3 ?v1) 
                           (pred_3 ?v1 ?v6))                                                          
        :effect (and (not (pred_2 ?v3 ?v1)) (pred_2 ?v3 ?v6)))

(:action op_2 
        :parameters (?v8 - type_5 ?v7 - type_1 ?v3 - type_4)
        :precondition (and (pred_2 ?v3 ?v8) 
                           (pred_2 ?v7 ?v8))
        :effect (and (not (pred_2 ?v7 ?v8))
                     (pred_5 ?v3 ?v7)))

(:action op_3 
        :parameters (?v8 - type_5 ?v7 - type_1 ?v3 - type_4 ?v2 - type_2)
        :precondition (and (pred_2 ?v3 ?v8) 
		      	   (pred_2 ?v2 ?v8)
			   (pred_5 ?v3 ?v7)
			   (pred_6 ?v7)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_6 ?v7)) (pred_1 ?v2)))
)