(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_5 type_4 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v7 - type_2 ?v2 - type_3)
	(pred_4 ?v7 - type_5 ?v4 - type_1)
	(pred_5 ?v4 - type_1)
	(pred_6 ?v6 - type_3 ?v8 - type_3)
	(pred_3 ?v1 - type_4)
	(pred_2 ?v1 - type_4))                                                                                           
(:action op_3 
        :parameters (?v5 - type_3 ?v3 - type_3 ?v7 - type_5)
        :precondition (and (pred_1 ?v7 ?v5) 
                           (pred_6 ?v5 ?v3))                                                          
        :effect (and (not (pred_1 ?v7 ?v5)) (pred_1 ?v7 ?v3)))

(:action op_2 
        :parameters (?v2 - type_3 ?v4 - type_1 ?v7 - type_5)
        :precondition (and (pred_1 ?v7 ?v2) 
                           (pred_1 ?v4 ?v2))
        :effect (and (not (pred_1 ?v4 ?v2))
                     (pred_4 ?v7 ?v4)))

(:action op_1 
        :parameters (?v2 - type_3 ?v4 - type_1 ?v7 - type_5 ?v1 - type_4)
        :precondition (and (pred_1 ?v7 ?v2) 
		      	   (pred_1 ?v1 ?v2)
			   (pred_4 ?v7 ?v4)
			   (pred_5 ?v4)
			   (pred_2 ?v1))
        :effect (and (not (pred_2 ?v1))(not (pred_5 ?v4)) (pred_3 ?v1)))
)