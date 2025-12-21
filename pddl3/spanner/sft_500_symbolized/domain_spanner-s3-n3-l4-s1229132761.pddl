(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_2 type_5 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_4 ?v3 - type_1)
	(pred_4 ?v7 - type_2 ?v4 - type_3)
	(pred_3 ?v4 - type_3)
	(pred_6 ?v8 - type_1 ?v2 - type_1)
	(pred_1 ?v5 - type_5)
	(pred_5 ?v5 - type_5))                                                                                           
(:action op_2 
        :parameters (?v1 - type_1 ?v6 - type_1 ?v7 - type_2)
        :precondition (and (pred_2 ?v7 ?v1) 
                           (pred_6 ?v1 ?v6))                                                          
        :effect (and (not (pred_2 ?v7 ?v1)) (pred_2 ?v7 ?v6)))

(:action op_1 
        :parameters (?v3 - type_1 ?v4 - type_3 ?v7 - type_2)
        :precondition (and (pred_2 ?v7 ?v3) 
                           (pred_2 ?v4 ?v3))
        :effect (and (not (pred_2 ?v4 ?v3))
                     (pred_4 ?v7 ?v4)))

(:action op_3 
        :parameters (?v3 - type_1 ?v4 - type_3 ?v7 - type_2 ?v5 - type_5)
        :precondition (and (pred_2 ?v7 ?v3) 
		      	   (pred_2 ?v5 ?v3)
			   (pred_4 ?v7 ?v4)
			   (pred_3 ?v4)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_3 ?v4)) (pred_1 ?v5)))
)