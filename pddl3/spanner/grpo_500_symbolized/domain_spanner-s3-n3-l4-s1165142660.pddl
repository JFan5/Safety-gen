(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_1 type_2 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v8 - type_5 ?v2 - type_3)
	(pred_1 ?v8 - type_1 ?v7 - type_4)
	(pred_2 ?v7 - type_4)
	(pred_4 ?v6 - type_3 ?v1 - type_3)
	(pred_5 ?v5 - type_2)
	(pred_3 ?v5 - type_2))                                                                                           
(:action op_3 
        :parameters (?v4 - type_3 ?v3 - type_3 ?v8 - type_1)
        :precondition (and (pred_6 ?v8 ?v4) 
                           (pred_4 ?v4 ?v3))                                                          
        :effect (and (not (pred_6 ?v8 ?v4)) (pred_6 ?v8 ?v3)))

(:action op_2 
        :parameters (?v2 - type_3 ?v7 - type_4 ?v8 - type_1)
        :precondition (and (pred_6 ?v8 ?v2) 
                           (pred_6 ?v7 ?v2))
        :effect (and (not (pred_6 ?v7 ?v2))
                     (pred_1 ?v8 ?v7)))

(:action op_1 
        :parameters (?v2 - type_3 ?v7 - type_4 ?v8 - type_1 ?v5 - type_2)
        :precondition (and (pred_6 ?v8 ?v2) 
		      	   (pred_6 ?v5 ?v2)
			   (pred_1 ?v8 ?v7)
			   (pred_2 ?v7)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_2 ?v7)) (pred_5 ?v5)))
)