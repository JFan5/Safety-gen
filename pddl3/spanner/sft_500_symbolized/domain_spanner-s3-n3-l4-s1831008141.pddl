(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_4 type_2 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v2 - type_3 ?v7 - type_5)
	(pred_5 ?v2 - type_4 ?v1 - type_1)
	(pred_1 ?v1 - type_1)
	(pred_4 ?v5 - type_5 ?v8 - type_5)
	(pred_3 ?v3 - type_2)
	(pred_6 ?v3 - type_2))                                                                                           
(:action op_2 
        :parameters (?v4 - type_5 ?v6 - type_5 ?v2 - type_4)
        :precondition (and (pred_2 ?v2 ?v4) 
                           (pred_4 ?v4 ?v6))                                                          
        :effect (and (not (pred_2 ?v2 ?v4)) (pred_2 ?v2 ?v6)))

(:action op_3 
        :parameters (?v7 - type_5 ?v1 - type_1 ?v2 - type_4)
        :precondition (and (pred_2 ?v2 ?v7) 
                           (pred_2 ?v1 ?v7))
        :effect (and (not (pred_2 ?v1 ?v7))
                     (pred_5 ?v2 ?v1)))

(:action op_1 
        :parameters (?v7 - type_5 ?v1 - type_1 ?v2 - type_4 ?v3 - type_2)
        :precondition (and (pred_2 ?v2 ?v7) 
		      	   (pred_2 ?v3 ?v7)
			   (pred_5 ?v2 ?v1)
			   (pred_1 ?v1)
			   (pred_6 ?v3))
        :effect (and (not (pred_6 ?v3))(not (pred_1 ?v1)) (pred_3 ?v3)))
)