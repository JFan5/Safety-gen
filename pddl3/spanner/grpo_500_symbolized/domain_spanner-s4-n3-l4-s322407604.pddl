(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_3 type_2 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v2 - type_1 ?v8 - type_5)
	(pred_2 ?v2 - type_3 ?v7 - type_4)
	(pred_5 ?v7 - type_4)
	(pred_3 ?v3 - type_5 ?v6 - type_5)
	(pred_4 ?v1 - type_2)
	(pred_6 ?v1 - type_2))                                                                                           
(:action op_2 
        :parameters (?v4 - type_5 ?v5 - type_5 ?v2 - type_3)
        :precondition (and (pred_1 ?v2 ?v4) 
                           (pred_3 ?v4 ?v5))                                                          
        :effect (and (not (pred_1 ?v2 ?v4)) (pred_1 ?v2 ?v5)))

(:action op_1 
        :parameters (?v8 - type_5 ?v7 - type_4 ?v2 - type_3)
        :precondition (and (pred_1 ?v2 ?v8) 
                           (pred_1 ?v7 ?v8))
        :effect (and (not (pred_1 ?v7 ?v8))
                     (pred_2 ?v2 ?v7)))

(:action op_3 
        :parameters (?v8 - type_5 ?v7 - type_4 ?v2 - type_3 ?v1 - type_2)
        :precondition (and (pred_1 ?v2 ?v8) 
		      	   (pred_1 ?v1 ?v8)
			   (pred_2 ?v2 ?v7)
			   (pred_5 ?v7)
			   (pred_6 ?v1))
        :effect (and (not (pred_6 ?v1))(not (pred_5 ?v7)) (pred_4 ?v1)))
)