(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_3 type_1 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v4 - type_2 ?v2 - type_5)
	(pred_5 ?v4 - type_3 ?v7 - type_4)
	(pred_4 ?v7 - type_4)
	(pred_1 ?v1 - type_5 ?v6 - type_5)
	(pred_2 ?v5 - type_1)
	(pred_6 ?v5 - type_1))                                                                                           
(:action op_1 
        :parameters (?v8 - type_5 ?v3 - type_5 ?v4 - type_3)
        :precondition (and (pred_3 ?v4 ?v8) 
                           (pred_1 ?v8 ?v3))                                                          
        :effect (and (not (pred_3 ?v4 ?v8)) (pred_3 ?v4 ?v3)))

(:action op_2 
        :parameters (?v2 - type_5 ?v7 - type_4 ?v4 - type_3)
        :precondition (and (pred_3 ?v4 ?v2) 
                           (pred_3 ?v7 ?v2))
        :effect (and (not (pred_3 ?v7 ?v2))
                     (pred_5 ?v4 ?v7)))

(:action op_3 
        :parameters (?v2 - type_5 ?v7 - type_4 ?v4 - type_3 ?v5 - type_1)
        :precondition (and (pred_3 ?v4 ?v2) 
		      	   (pred_3 ?v5 ?v2)
			   (pred_5 ?v4 ?v7)
			   (pred_4 ?v7)
			   (pred_6 ?v5))
        :effect (and (not (pred_6 ?v5))(not (pred_4 ?v7)) (pred_2 ?v5)))
)