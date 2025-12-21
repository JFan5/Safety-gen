(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_4 type_2 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_5 ?v3 - type_1)
	(pred_2 ?v6 - type_4 ?v7 - type_3)
	(pred_1 ?v7 - type_3)
	(pred_6 ?v8 - type_1 ?v5 - type_1)
	(pred_3 ?v2 - type_2)
	(pred_4 ?v2 - type_2))                                                                                           
(:action op_1 
        :parameters (?v1 - type_1 ?v4 - type_1 ?v6 - type_4)
        :precondition (and (pred_5 ?v6 ?v1) 
                           (pred_6 ?v1 ?v4))                                                          
        :effect (and (not (pred_5 ?v6 ?v1)) (pred_5 ?v6 ?v4)))

(:action op_3 
        :parameters (?v3 - type_1 ?v7 - type_3 ?v6 - type_4)
        :precondition (and (pred_5 ?v6 ?v3) 
                           (pred_5 ?v7 ?v3))
        :effect (and (not (pred_5 ?v7 ?v3))
                     (pred_2 ?v6 ?v7)))

(:action op_2 
        :parameters (?v3 - type_1 ?v7 - type_3 ?v6 - type_4 ?v2 - type_2)
        :precondition (and (pred_5 ?v6 ?v3) 
		      	   (pred_5 ?v2 ?v3)
			   (pred_2 ?v6 ?v7)
			   (pred_1 ?v7)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_1 ?v7)) (pred_3 ?v2)))
)