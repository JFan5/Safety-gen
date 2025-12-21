(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_2 type_5 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v1 - type_1 ?v2 - type_4)
	(pred_5 ?v1 - type_2 ?v7 - type_3)
	(pred_2 ?v7 - type_3)
	(pred_1 ?v6 - type_4 ?v4 - type_4)
	(pred_4 ?v5 - type_5)
	(pred_3 ?v5 - type_5))                                                                                           
(:action op_3 
        :parameters (?v8 - type_4 ?v3 - type_4 ?v1 - type_2)
        :precondition (and (pred_6 ?v1 ?v8) 
                           (pred_1 ?v8 ?v3))                                                          
        :effect (and (not (pred_6 ?v1 ?v8)) (pred_6 ?v1 ?v3)))

(:action op_2 
        :parameters (?v2 - type_4 ?v7 - type_3 ?v1 - type_2)
        :precondition (and (pred_6 ?v1 ?v2) 
                           (pred_6 ?v7 ?v2))
        :effect (and (not (pred_6 ?v7 ?v2))
                     (pred_5 ?v1 ?v7)))

(:action op_1 
        :parameters (?v2 - type_4 ?v7 - type_3 ?v1 - type_2 ?v5 - type_5)
        :precondition (and (pred_6 ?v1 ?v2) 
		      	   (pred_6 ?v5 ?v2)
			   (pred_5 ?v1 ?v7)
			   (pred_2 ?v7)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_2 ?v7)) (pred_4 ?v5)))
)