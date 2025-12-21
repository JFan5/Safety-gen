(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_2 type_4 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v8 - type_3 ?v5 - type_5)
	(pred_2 ?v8 - type_2 ?v4 - type_1)
	(pred_4 ?v4 - type_1)
	(pred_5 ?v3 - type_5 ?v1 - type_5)
	(pred_3 ?v2 - type_4)
	(pred_1 ?v2 - type_4))                                                                                           
(:action op_1 
        :parameters (?v7 - type_5 ?v6 - type_5 ?v8 - type_2)
        :precondition (and (pred_6 ?v8 ?v7) 
                           (pred_5 ?v7 ?v6))                                                          
        :effect (and (not (pred_6 ?v8 ?v7)) (pred_6 ?v8 ?v6)))

(:action op_2 
        :parameters (?v5 - type_5 ?v4 - type_1 ?v8 - type_2)
        :precondition (and (pred_6 ?v8 ?v5) 
                           (pred_6 ?v4 ?v5))
        :effect (and (not (pred_6 ?v4 ?v5))
                     (pred_2 ?v8 ?v4)))

(:action op_3 
        :parameters (?v5 - type_5 ?v4 - type_1 ?v8 - type_2 ?v2 - type_4)
        :precondition (and (pred_6 ?v8 ?v5) 
		      	   (pred_6 ?v2 ?v5)
			   (pred_2 ?v8 ?v4)
			   (pred_4 ?v4)
			   (pred_1 ?v2))
        :effect (and (not (pred_1 ?v2))(not (pred_4 ?v4)) (pred_3 ?v2)))
)