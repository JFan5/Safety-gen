(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_1 type_3 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_4 ?v5 - type_2)
	(pred_1 ?v3 - type_1 ?v2 - type_5)
	(pred_3 ?v2 - type_5)
	(pred_6 ?v6 - type_2 ?v8 - type_2)
	(pred_4 ?v4 - type_3)
	(pred_5 ?v4 - type_3))                                                                                           
(:action op_3 
        :parameters (?v1 - type_2 ?v7 - type_2 ?v3 - type_1)
        :precondition (and (pred_2 ?v3 ?v1) 
                           (pred_6 ?v1 ?v7))                                                          
        :effect (and (not (pred_2 ?v3 ?v1)) (pred_2 ?v3 ?v7)))

(:action op_1 
        :parameters (?v5 - type_2 ?v2 - type_5 ?v3 - type_1)
        :precondition (and (pred_2 ?v3 ?v5) 
                           (pred_2 ?v2 ?v5))
        :effect (and (not (pred_2 ?v2 ?v5))
                     (pred_1 ?v3 ?v2)))

(:action op_2 
        :parameters (?v5 - type_2 ?v2 - type_5 ?v3 - type_1 ?v4 - type_3)
        :precondition (and (pred_2 ?v3 ?v5) 
		      	   (pred_2 ?v4 ?v5)
			   (pred_1 ?v3 ?v2)
			   (pred_3 ?v2)
			   (pred_5 ?v4))
        :effect (and (not (pred_5 ?v4))(not (pred_3 ?v2)) (pred_4 ?v4)))
)