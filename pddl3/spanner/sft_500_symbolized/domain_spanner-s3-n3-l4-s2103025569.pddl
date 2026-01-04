(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_2 type_1 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v2 - type_4 ?v5 - type_5)
	(pred_6 ?v2 - type_2 ?v7 - type_3)
	(pred_5 ?v7 - type_3)
	(pred_2 ?v1 - type_5 ?v3 - type_5)
	(pred_1 ?v4 - type_1)
	(pred_3 ?v4 - type_1))                                                                                           
(:action op_3 
        :parameters (?v6 - type_5 ?v8 - type_5 ?v2 - type_2)
        :precondition (and (pred_4 ?v2 ?v6) 
                           (pred_2 ?v6 ?v8))                                                          
        :effect (and (not (pred_4 ?v2 ?v6)) (pred_4 ?v2 ?v8)))

(:action op_1 
        :parameters (?v5 - type_5 ?v7 - type_3 ?v2 - type_2)
        :precondition (and (pred_4 ?v2 ?v5) 
                           (pred_4 ?v7 ?v5))
        :effect (and (not (pred_4 ?v7 ?v5))
                     (pred_6 ?v2 ?v7)))

(:action op_2 
        :parameters (?v5 - type_5 ?v7 - type_3 ?v2 - type_2 ?v4 - type_1)
        :precondition (and (pred_4 ?v2 ?v5) 
		      	   (pred_4 ?v4 ?v5)
			   (pred_6 ?v2 ?v7)
			   (pred_5 ?v7)
			   (pred_3 ?v4))
        :effect (and (not (pred_3 ?v4))(not (pred_5 ?v7)) (pred_1 ?v4)))
)