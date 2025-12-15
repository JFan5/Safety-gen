(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_2 type_5 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_4 ?v4 - type_1)
	(pred_2 ?v6 - type_2 ?v7 - type_3)
	(pred_4 ?v7 - type_3)
	(pred_6 ?v1 - type_1 ?v8 - type_1)
	(pred_1 ?v2 - type_5)
	(pred_3 ?v2 - type_5))                                                                                           
(:action op_1 
        :parameters (?v5 - type_1 ?v3 - type_1 ?v6 - type_2)
        :precondition (and (pred_5 ?v6 ?v5) 
                           (pred_6 ?v5 ?v3))                                                          
        :effect (and (not (pred_5 ?v6 ?v5)) (pred_5 ?v6 ?v3)))

(:action op_3 
        :parameters (?v4 - type_1 ?v7 - type_3 ?v6 - type_2)
        :precondition (and (pred_5 ?v6 ?v4) 
                           (pred_5 ?v7 ?v4))
        :effect (and (not (pred_5 ?v7 ?v4))
                     (pred_2 ?v6 ?v7)))

(:action op_2 
        :parameters (?v4 - type_1 ?v7 - type_3 ?v6 - type_2 ?v2 - type_5)
        :precondition (and (pred_5 ?v6 ?v4) 
		      	   (pred_5 ?v2 ?v4)
			   (pred_2 ?v6 ?v7)
			   (pred_4 ?v7)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_4 ?v7)) (pred_1 ?v2)))
)