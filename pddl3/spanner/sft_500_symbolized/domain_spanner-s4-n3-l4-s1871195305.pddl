(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_5 type_1 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v6 - type_4 ?v3 - type_2)
	(pred_3 ?v6 - type_5 ?v7 - type_3)
	(pred_1 ?v7 - type_3)
	(pred_4 ?v8 - type_2 ?v5 - type_2)
	(pred_5 ?v2 - type_1)
	(pred_2 ?v2 - type_1))                                                                                           
(:action op_2 
        :parameters (?v4 - type_2 ?v1 - type_2 ?v6 - type_5)
        :precondition (and (pred_6 ?v6 ?v4) 
                           (pred_4 ?v4 ?v1))                                                          
        :effect (and (not (pred_6 ?v6 ?v4)) (pred_6 ?v6 ?v1)))

(:action op_3 
        :parameters (?v3 - type_2 ?v7 - type_3 ?v6 - type_5)
        :precondition (and (pred_6 ?v6 ?v3) 
                           (pred_6 ?v7 ?v3))
        :effect (and (not (pred_6 ?v7 ?v3))
                     (pred_3 ?v6 ?v7)))

(:action op_1 
        :parameters (?v3 - type_2 ?v7 - type_3 ?v6 - type_5 ?v2 - type_1)
        :precondition (and (pred_6 ?v6 ?v3) 
		      	   (pred_6 ?v2 ?v3)
			   (pred_3 ?v6 ?v7)
			   (pred_1 ?v7)
			   (pred_2 ?v2))
        :effect (and (not (pred_2 ?v2))(not (pred_1 ?v7)) (pred_5 ?v2)))
)