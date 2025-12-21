(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_5 type_4 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_1 ?v2 - type_3)
	(pred_6 ?v4 - type_5 ?v7 - type_2)
	(pred_5 ?v7 - type_2)
	(pred_1 ?v3 - type_3 ?v1 - type_3)
	(pred_4 ?v5 - type_4)
	(pred_3 ?v5 - type_4))                                                                                           
(:action op_2 
        :parameters (?v8 - type_3 ?v6 - type_3 ?v4 - type_5)
        :precondition (and (pred_2 ?v4 ?v8) 
                           (pred_1 ?v8 ?v6))                                                          
        :effect (and (not (pred_2 ?v4 ?v8)) (pred_2 ?v4 ?v6)))

(:action op_1 
        :parameters (?v2 - type_3 ?v7 - type_2 ?v4 - type_5)
        :precondition (and (pred_2 ?v4 ?v2) 
                           (pred_2 ?v7 ?v2))
        :effect (and (not (pred_2 ?v7 ?v2))
                     (pred_6 ?v4 ?v7)))

(:action op_3 
        :parameters (?v2 - type_3 ?v7 - type_2 ?v4 - type_5 ?v5 - type_4)
        :precondition (and (pred_2 ?v4 ?v2) 
		      	   (pred_2 ?v5 ?v2)
			   (pred_6 ?v4 ?v7)
			   (pred_5 ?v7)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_5 ?v7)) (pred_4 ?v5)))
)