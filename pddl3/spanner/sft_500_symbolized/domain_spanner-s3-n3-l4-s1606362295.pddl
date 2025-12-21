(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_2 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v5 - type_3 ?v4 - type_1)
	(pred_3 ?v5 - type_2 ?v7 - type_4)
	(pred_1 ?v7 - type_4)
	(pred_4 ?v2 - type_1 ?v8 - type_1)
	(pred_5 ?v1 - type_5)
	(pred_2 ?v1 - type_5))                                                                                           
(:action op_3 
        :parameters (?v6 - type_1 ?v3 - type_1 ?v5 - type_2)
        :precondition (and (pred_6 ?v5 ?v6) 
                           (pred_4 ?v6 ?v3))                                                          
        :effect (and (not (pred_6 ?v5 ?v6)) (pred_6 ?v5 ?v3)))

(:action op_2 
        :parameters (?v4 - type_1 ?v7 - type_4 ?v5 - type_2)
        :precondition (and (pred_6 ?v5 ?v4) 
                           (pred_6 ?v7 ?v4))
        :effect (and (not (pred_6 ?v7 ?v4))
                     (pred_3 ?v5 ?v7)))

(:action op_1 
        :parameters (?v4 - type_1 ?v7 - type_4 ?v5 - type_2 ?v1 - type_5)
        :precondition (and (pred_6 ?v5 ?v4) 
		      	   (pred_6 ?v1 ?v4)
			   (pred_3 ?v5 ?v7)
			   (pred_1 ?v7)
			   (pred_2 ?v1))
        :effect (and (not (pred_2 ?v1))(not (pred_1 ?v7)) (pred_5 ?v1)))
)