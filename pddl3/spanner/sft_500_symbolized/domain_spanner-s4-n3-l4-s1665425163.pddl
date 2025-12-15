(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_4 type_3 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_1 ?v5 - type_5)
	(pred_5 ?v1 - type_4 ?v7 - type_2)
	(pred_2 ?v7 - type_2)
	(pred_4 ?v6 - type_5 ?v2 - type_5)
	(pred_6 ?v4 - type_3)
	(pred_1 ?v4 - type_3))                                                                                           
(:action op_3 
        :parameters (?v8 - type_5 ?v3 - type_5 ?v1 - type_4)
        :precondition (and (pred_3 ?v1 ?v8) 
                           (pred_4 ?v8 ?v3))                                                          
        :effect (and (not (pred_3 ?v1 ?v8)) (pred_3 ?v1 ?v3)))

(:action op_1 
        :parameters (?v5 - type_5 ?v7 - type_2 ?v1 - type_4)
        :precondition (and (pred_3 ?v1 ?v5) 
                           (pred_3 ?v7 ?v5))
        :effect (and (not (pred_3 ?v7 ?v5))
                     (pred_5 ?v1 ?v7)))

(:action op_2 
        :parameters (?v5 - type_5 ?v7 - type_2 ?v1 - type_4 ?v4 - type_3)
        :precondition (and (pred_3 ?v1 ?v5) 
		      	   (pred_3 ?v4 ?v5)
			   (pred_5 ?v1 ?v7)
			   (pred_2 ?v7)
			   (pred_1 ?v4))
        :effect (and (not (pred_1 ?v4))(not (pred_2 ?v7)) (pred_6 ?v4)))
)