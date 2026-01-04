(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_4 type_5 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v4 - type_3 ?v8 - type_1)
	(pred_2 ?v4 - type_4 ?v7 - type_2)
	(pred_6 ?v7 - type_2)
	(pred_3 ?v3 - type_1 ?v1 - type_1)
	(pred_4 ?v2 - type_5)
	(pred_1 ?v2 - type_5))                                                                                           
(:action op_2 
        :parameters (?v5 - type_1 ?v6 - type_1 ?v4 - type_4)
        :precondition (and (pred_5 ?v4 ?v5) 
                           (pred_3 ?v5 ?v6))                                                          
        :effect (and (not (pred_5 ?v4 ?v5)) (pred_5 ?v4 ?v6)))

(:action op_3 
        :parameters (?v8 - type_1 ?v7 - type_2 ?v4 - type_4)
        :precondition (and (pred_5 ?v4 ?v8) 
                           (pred_5 ?v7 ?v8))
        :effect (and (not (pred_5 ?v7 ?v8))
                     (pred_2 ?v4 ?v7)))

(:action op_1 
        :parameters (?v8 - type_1 ?v7 - type_2 ?v4 - type_4 ?v2 - type_5)
        :precondition (and (pred_5 ?v4 ?v8) 
		      	   (pred_5 ?v2 ?v8)
			   (pred_2 ?v4 ?v7)
			   (pred_6 ?v7)
			   (pred_1 ?v2))
        :effect (and (not (pred_1 ?v2))(not (pred_6 ?v7)) (pred_4 ?v2)))
)