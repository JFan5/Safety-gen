(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_2 type_3 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v7 - type_1 ?v5 - type_4)
	(pred_6 ?v7 - type_2 ?v1 - type_5)
	(pred_3 ?v1 - type_5)
	(pred_1 ?v8 - type_4 ?v3 - type_4)
	(pred_4 ?v4 - type_3)
	(pred_2 ?v4 - type_3))                                                                                           
(:action op_2 
        :parameters (?v2 - type_4 ?v6 - type_4 ?v7 - type_2)
        :precondition (and (pred_5 ?v7 ?v2) 
                           (pred_1 ?v2 ?v6))                                                          
        :effect (and (not (pred_5 ?v7 ?v2)) (pred_5 ?v7 ?v6)))

(:action op_3 
        :parameters (?v5 - type_4 ?v1 - type_5 ?v7 - type_2)
        :precondition (and (pred_5 ?v7 ?v5) 
                           (pred_5 ?v1 ?v5))
        :effect (and (not (pred_5 ?v1 ?v5))
                     (pred_6 ?v7 ?v1)))

(:action op_1 
        :parameters (?v5 - type_4 ?v1 - type_5 ?v7 - type_2 ?v4 - type_3)
        :precondition (and (pred_5 ?v7 ?v5) 
		      	   (pred_5 ?v4 ?v5)
			   (pred_6 ?v7 ?v1)
			   (pred_3 ?v1)
			   (pred_2 ?v4))
        :effect (and (not (pred_2 ?v4))(not (pred_3 ?v1)) (pred_4 ?v4)))
)