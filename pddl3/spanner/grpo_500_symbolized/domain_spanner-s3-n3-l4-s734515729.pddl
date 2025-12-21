(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_1 type_2 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v4 - type_4 ?v5 - type_3)
	(pred_3 ?v4 - type_1 ?v1 - type_5)
	(pred_6 ?v1 - type_5)
	(pred_1 ?v7 - type_3 ?v8 - type_3)
	(pred_5 ?v2 - type_2)
	(pred_2 ?v2 - type_2))                                                                                           
(:action op_1 
        :parameters (?v3 - type_3 ?v6 - type_3 ?v4 - type_1)
        :precondition (and (pred_4 ?v4 ?v3) 
                           (pred_1 ?v3 ?v6))                                                          
        :effect (and (not (pred_4 ?v4 ?v3)) (pred_4 ?v4 ?v6)))

(:action op_3 
        :parameters (?v5 - type_3 ?v1 - type_5 ?v4 - type_1)
        :precondition (and (pred_4 ?v4 ?v5) 
                           (pred_4 ?v1 ?v5))
        :effect (and (not (pred_4 ?v1 ?v5))
                     (pred_3 ?v4 ?v1)))

(:action op_2 
        :parameters (?v5 - type_3 ?v1 - type_5 ?v4 - type_1 ?v2 - type_2)
        :precondition (and (pred_4 ?v4 ?v5) 
		      	   (pred_4 ?v2 ?v5)
			   (pred_3 ?v4 ?v1)
			   (pred_6 ?v1)
			   (pred_2 ?v2))
        :effect (and (not (pred_2 ?v2))(not (pred_6 ?v1)) (pred_5 ?v2)))
)