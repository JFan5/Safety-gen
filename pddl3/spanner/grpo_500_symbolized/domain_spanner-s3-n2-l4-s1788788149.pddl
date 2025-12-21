(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_1 type_5 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_3 ?v4 - type_4)
	(pred_2 ?v5 - type_1 ?v1 - type_2)
	(pred_3 ?v1 - type_2)
	(pred_5 ?v3 - type_4 ?v8 - type_4)
	(pred_1 ?v2 - type_5)
	(pred_6 ?v2 - type_5))                                                                                           
(:action op_3 
        :parameters (?v7 - type_4 ?v6 - type_4 ?v5 - type_1)
        :precondition (and (pred_4 ?v5 ?v7) 
                           (pred_5 ?v7 ?v6))                                                          
        :effect (and (not (pred_4 ?v5 ?v7)) (pred_4 ?v5 ?v6)))

(:action op_2 
        :parameters (?v4 - type_4 ?v1 - type_2 ?v5 - type_1)
        :precondition (and (pred_4 ?v5 ?v4) 
                           (pred_4 ?v1 ?v4))
        :effect (and (not (pred_4 ?v1 ?v4))
                     (pred_2 ?v5 ?v1)))

(:action op_1 
        :parameters (?v4 - type_4 ?v1 - type_2 ?v5 - type_1 ?v2 - type_5)
        :precondition (and (pred_4 ?v5 ?v4) 
		      	   (pred_4 ?v2 ?v4)
			   (pred_2 ?v5 ?v1)
			   (pred_3 ?v1)
			   (pred_6 ?v2))
        :effect (and (not (pred_6 ?v2))(not (pred_3 ?v1)) (pred_1 ?v2)))
)