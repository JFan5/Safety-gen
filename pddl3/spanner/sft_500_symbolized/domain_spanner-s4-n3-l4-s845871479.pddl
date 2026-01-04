(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_1 type_3 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_4 ?v2 - type_2)
	(pred_1 ?v7 - type_1 ?v6 - type_5)
	(pred_5 ?v6 - type_5)
	(pred_6 ?v8 - type_2 ?v3 - type_2)
	(pred_3 ?v5 - type_3)
	(pred_4 ?v5 - type_3))                                                                                           
(:action op_2 
        :parameters (?v1 - type_2 ?v4 - type_2 ?v7 - type_1)
        :precondition (and (pred_2 ?v7 ?v1) 
                           (pred_6 ?v1 ?v4))                                                          
        :effect (and (not (pred_2 ?v7 ?v1)) (pred_2 ?v7 ?v4)))

(:action op_1 
        :parameters (?v2 - type_2 ?v6 - type_5 ?v7 - type_1)
        :precondition (and (pred_2 ?v7 ?v2) 
                           (pred_2 ?v6 ?v2))
        :effect (and (not (pred_2 ?v6 ?v2))
                     (pred_1 ?v7 ?v6)))

(:action op_3 
        :parameters (?v2 - type_2 ?v6 - type_5 ?v7 - type_1 ?v5 - type_3)
        :precondition (and (pred_2 ?v7 ?v2) 
		      	   (pred_2 ?v5 ?v2)
			   (pred_1 ?v7 ?v6)
			   (pred_5 ?v6)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_5 ?v6)) (pred_3 ?v5)))
)