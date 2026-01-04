(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_1 type_5 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_2 ?v5 - type_4)
	(pred_2 ?v6 - type_1 ?v7 - type_3)
	(pred_4 ?v7 - type_3)
	(pred_1 ?v8 - type_4 ?v1 - type_4)
	(pred_3 ?v3 - type_5)
	(pred_6 ?v3 - type_5))                                                                                           
(:action op_3 
        :parameters (?v4 - type_4 ?v2 - type_4 ?v6 - type_1)
        :precondition (and (pred_5 ?v6 ?v4) 
                           (pred_1 ?v4 ?v2))                                                          
        :effect (and (not (pred_5 ?v6 ?v4)) (pred_5 ?v6 ?v2)))

(:action op_2 
        :parameters (?v5 - type_4 ?v7 - type_3 ?v6 - type_1)
        :precondition (and (pred_5 ?v6 ?v5) 
                           (pred_5 ?v7 ?v5))
        :effect (and (not (pred_5 ?v7 ?v5))
                     (pred_2 ?v6 ?v7)))

(:action op_1 
        :parameters (?v5 - type_4 ?v7 - type_3 ?v6 - type_1 ?v3 - type_5)
        :precondition (and (pred_5 ?v6 ?v5) 
		      	   (pred_5 ?v3 ?v5)
			   (pred_2 ?v6 ?v7)
			   (pred_4 ?v7)
			   (pred_6 ?v3))
        :effect (and (not (pred_6 ?v3))(not (pred_4 ?v7)) (pred_3 ?v3)))
)