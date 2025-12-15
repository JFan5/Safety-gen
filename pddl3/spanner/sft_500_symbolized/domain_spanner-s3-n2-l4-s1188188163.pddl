(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_1 type_2 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v2 - type_4 ?v1 - type_3)
	(pred_1 ?v2 - type_1 ?v4 - type_5)
	(pred_4 ?v4 - type_5)
	(pred_2 ?v6 - type_3 ?v3 - type_3)
	(pred_6 ?v7 - type_2)
	(pred_3 ?v7 - type_2))                                                                                           
(:action op_3 
        :parameters (?v5 - type_3 ?v8 - type_3 ?v2 - type_1)
        :precondition (and (pred_5 ?v2 ?v5) 
                           (pred_2 ?v5 ?v8))                                                          
        :effect (and (not (pred_5 ?v2 ?v5)) (pred_5 ?v2 ?v8)))

(:action op_1 
        :parameters (?v1 - type_3 ?v4 - type_5 ?v2 - type_1)
        :precondition (and (pred_5 ?v2 ?v1) 
                           (pred_5 ?v4 ?v1))
        :effect (and (not (pred_5 ?v4 ?v1))
                     (pred_1 ?v2 ?v4)))

(:action op_2 
        :parameters (?v1 - type_3 ?v4 - type_5 ?v2 - type_1 ?v7 - type_2)
        :precondition (and (pred_5 ?v2 ?v1) 
		      	   (pred_5 ?v7 ?v1)
			   (pred_1 ?v2 ?v4)
			   (pred_4 ?v4)
			   (pred_3 ?v7))
        :effect (and (not (pred_3 ?v7))(not (pred_4 ?v4)) (pred_6 ?v7)))
)