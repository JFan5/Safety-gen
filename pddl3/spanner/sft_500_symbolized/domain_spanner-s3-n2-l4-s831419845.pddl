(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_1 type_2 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v3 - type_5 ?v2 - type_3)
	(pred_4 ?v3 - type_1 ?v7 - type_4)
	(pred_3 ?v7 - type_4)
	(pred_6 ?v4 - type_3 ?v6 - type_3)
	(pred_1 ?v8 - type_2)
	(pred_2 ?v8 - type_2))                                                                                           
(:action op_3 
        :parameters (?v1 - type_3 ?v5 - type_3 ?v3 - type_1)
        :precondition (and (pred_5 ?v3 ?v1) 
                           (pred_6 ?v1 ?v5))                                                          
        :effect (and (not (pred_5 ?v3 ?v1)) (pred_5 ?v3 ?v5)))

(:action op_1 
        :parameters (?v2 - type_3 ?v7 - type_4 ?v3 - type_1)
        :precondition (and (pred_5 ?v3 ?v2) 
                           (pred_5 ?v7 ?v2))
        :effect (and (not (pred_5 ?v7 ?v2))
                     (pred_4 ?v3 ?v7)))

(:action op_2 
        :parameters (?v2 - type_3 ?v7 - type_4 ?v3 - type_1 ?v8 - type_2)
        :precondition (and (pred_5 ?v3 ?v2) 
		      	   (pred_5 ?v8 ?v2)
			   (pred_4 ?v3 ?v7)
			   (pred_3 ?v7)
			   (pred_2 ?v8))
        :effect (and (not (pred_2 ?v8))(not (pred_3 ?v7)) (pred_1 ?v8)))
)