(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_1 type_4 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v4 - type_2 ?v3 - type_3)
	(pred_5 ?v4 - type_1 ?v7 - type_5)
	(pred_2 ?v7 - type_5)
	(pred_4 ?v5 - type_3 ?v8 - type_3)
	(pred_1 ?v2 - type_4)
	(pred_3 ?v2 - type_4))                                                                                           
(:action op_1 
        :parameters (?v6 - type_3 ?v1 - type_3 ?v4 - type_1)
        :precondition (and (pred_6 ?v4 ?v6) 
                           (pred_4 ?v6 ?v1))                                                          
        :effect (and (not (pred_6 ?v4 ?v6)) (pred_6 ?v4 ?v1)))

(:action op_2 
        :parameters (?v3 - type_3 ?v7 - type_5 ?v4 - type_1)
        :precondition (and (pred_6 ?v4 ?v3) 
                           (pred_6 ?v7 ?v3))
        :effect (and (not (pred_6 ?v7 ?v3))
                     (pred_5 ?v4 ?v7)))

(:action op_3 
        :parameters (?v3 - type_3 ?v7 - type_5 ?v4 - type_1 ?v2 - type_4)
        :precondition (and (pred_6 ?v4 ?v3) 
		      	   (pred_6 ?v2 ?v3)
			   (pred_5 ?v4 ?v7)
			   (pred_2 ?v7)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_2 ?v7)) (pred_1 ?v2)))
)