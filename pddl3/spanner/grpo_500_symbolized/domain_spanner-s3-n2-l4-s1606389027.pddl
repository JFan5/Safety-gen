(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_2 type_5 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v7 - type_1 ?v2 - type_3)
	(pred_3 ?v7 - type_2 ?v3 - type_4)
	(pred_6 ?v3 - type_4)
	(pred_1 ?v8 - type_3 ?v4 - type_3)
	(pred_2 ?v5 - type_5)
	(pred_5 ?v5 - type_5))                                                                                           
(:action op_1 
        :parameters (?v1 - type_3 ?v6 - type_3 ?v7 - type_2)
        :precondition (and (pred_4 ?v7 ?v1) 
                           (pred_1 ?v1 ?v6))                                                          
        :effect (and (not (pred_4 ?v7 ?v1)) (pred_4 ?v7 ?v6)))

(:action op_3 
        :parameters (?v2 - type_3 ?v3 - type_4 ?v7 - type_2)
        :precondition (and (pred_4 ?v7 ?v2) 
                           (pred_4 ?v3 ?v2))
        :effect (and (not (pred_4 ?v3 ?v2))
                     (pred_3 ?v7 ?v3)))

(:action op_2 
        :parameters (?v2 - type_3 ?v3 - type_4 ?v7 - type_2 ?v5 - type_5)
        :precondition (and (pred_4 ?v7 ?v2) 
		      	   (pred_4 ?v5 ?v2)
			   (pred_3 ?v7 ?v3)
			   (pred_6 ?v3)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_6 ?v3)) (pred_2 ?v5)))
)