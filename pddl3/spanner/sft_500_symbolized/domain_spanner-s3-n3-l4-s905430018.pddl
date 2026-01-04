(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_3 type_2 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_4 ?v6 - type_5)
	(pred_5 ?v1 - type_3 ?v4 - type_1)
	(pred_2 ?v4 - type_1)
	(pred_4 ?v8 - type_5 ?v3 - type_5)
	(pred_1 ?v2 - type_2)
	(pred_6 ?v2 - type_2))                                                                                           
(:action op_3 
        :parameters (?v5 - type_5 ?v7 - type_5 ?v1 - type_3)
        :precondition (and (pred_3 ?v1 ?v5) 
                           (pred_4 ?v5 ?v7))                                                          
        :effect (and (not (pred_3 ?v1 ?v5)) (pred_3 ?v1 ?v7)))

(:action op_2 
        :parameters (?v6 - type_5 ?v4 - type_1 ?v1 - type_3)
        :precondition (and (pred_3 ?v1 ?v6) 
                           (pred_3 ?v4 ?v6))
        :effect (and (not (pred_3 ?v4 ?v6))
                     (pred_5 ?v1 ?v4)))

(:action op_1 
        :parameters (?v6 - type_5 ?v4 - type_1 ?v1 - type_3 ?v2 - type_2)
        :precondition (and (pred_3 ?v1 ?v6) 
		      	   (pred_3 ?v2 ?v6)
			   (pred_5 ?v1 ?v4)
			   (pred_2 ?v4)
			   (pred_6 ?v2))
        :effect (and (not (pred_6 ?v2))(not (pred_2 ?v4)) (pred_1 ?v2)))
)