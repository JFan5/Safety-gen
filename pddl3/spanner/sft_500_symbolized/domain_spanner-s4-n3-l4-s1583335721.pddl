(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_2 type_1 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_4 ?v2 - type_5)
	(pred_6 ?v7 - type_2 ?v4 - type_3)
	(pred_5 ?v4 - type_3)
	(pred_3 ?v5 - type_5 ?v3 - type_5)
	(pred_4 ?v6 - type_1)
	(pred_1 ?v6 - type_1))                                                                                           
(:action op_1 
        :parameters (?v8 - type_5 ?v1 - type_5 ?v7 - type_2)
        :precondition (and (pred_2 ?v7 ?v8) 
                           (pred_3 ?v8 ?v1))                                                          
        :effect (and (not (pred_2 ?v7 ?v8)) (pred_2 ?v7 ?v1)))

(:action op_3 
        :parameters (?v2 - type_5 ?v4 - type_3 ?v7 - type_2)
        :precondition (and (pred_2 ?v7 ?v2) 
                           (pred_2 ?v4 ?v2))
        :effect (and (not (pred_2 ?v4 ?v2))
                     (pred_6 ?v7 ?v4)))

(:action op_2 
        :parameters (?v2 - type_5 ?v4 - type_3 ?v7 - type_2 ?v6 - type_1)
        :precondition (and (pred_2 ?v7 ?v2) 
		      	   (pred_2 ?v6 ?v2)
			   (pred_6 ?v7 ?v4)
			   (pred_5 ?v4)
			   (pred_1 ?v6))
        :effect (and (not (pred_1 ?v6))(not (pred_5 ?v4)) (pred_4 ?v6)))
)