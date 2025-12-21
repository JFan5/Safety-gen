(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_1 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v1 - type_3 ?v5 - type_2)
	(pred_1 ?v1 - type_1 ?v2 - type_4)
	(pred_2 ?v2 - type_4)
	(pred_3 ?v3 - type_2 ?v8 - type_2)
	(pred_6 ?v4 - type_5)
	(pred_4 ?v4 - type_5))                                                                                           
(:action op_3 
        :parameters (?v7 - type_2 ?v6 - type_2 ?v1 - type_1)
        :precondition (and (pred_5 ?v1 ?v7) 
                           (pred_3 ?v7 ?v6))                                                          
        :effect (and (not (pred_5 ?v1 ?v7)) (pred_5 ?v1 ?v6)))

(:action op_2 
        :parameters (?v5 - type_2 ?v2 - type_4 ?v1 - type_1)
        :precondition (and (pred_5 ?v1 ?v5) 
                           (pred_5 ?v2 ?v5))
        :effect (and (not (pred_5 ?v2 ?v5))
                     (pred_1 ?v1 ?v2)))

(:action op_1 
        :parameters (?v5 - type_2 ?v2 - type_4 ?v1 - type_1 ?v4 - type_5)
        :precondition (and (pred_5 ?v1 ?v5) 
		      	   (pred_5 ?v4 ?v5)
			   (pred_1 ?v1 ?v2)
			   (pred_2 ?v2)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_2 ?v2)) (pred_6 ?v4)))
)