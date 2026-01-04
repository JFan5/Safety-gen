(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_5 type_2 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v3 - type_1 ?v1 - type_3)
	(pred_2 ?v3 - type_5 ?v4 - type_4)
	(pred_6 ?v4 - type_4)
	(pred_4 ?v6 - type_3 ?v8 - type_3)
	(pred_3 ?v7 - type_2)
	(pred_5 ?v7 - type_2))                                                                                           
(:action op_3 
        :parameters (?v2 - type_3 ?v5 - type_3 ?v3 - type_5)
        :precondition (and (pred_1 ?v3 ?v2) 
                           (pred_4 ?v2 ?v5))                                                          
        :effect (and (not (pred_1 ?v3 ?v2)) (pred_1 ?v3 ?v5)))

(:action op_1 
        :parameters (?v1 - type_3 ?v4 - type_4 ?v3 - type_5)
        :precondition (and (pred_1 ?v3 ?v1) 
                           (pred_1 ?v4 ?v1))
        :effect (and (not (pred_1 ?v4 ?v1))
                     (pred_2 ?v3 ?v4)))

(:action op_2 
        :parameters (?v1 - type_3 ?v4 - type_4 ?v3 - type_5 ?v7 - type_2)
        :precondition (and (pred_1 ?v3 ?v1) 
		      	   (pred_1 ?v7 ?v1)
			   (pred_2 ?v3 ?v4)
			   (pred_6 ?v4)
			   (pred_5 ?v7))
        :effect (and (not (pred_5 ?v7))(not (pred_6 ?v4)) (pred_3 ?v7)))
)