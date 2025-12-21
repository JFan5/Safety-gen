(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_5 type_2 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v7 - type_4 ?v6 - type_3)
	(pred_2 ?v7 - type_5 ?v3 - type_1)
	(pred_6 ?v3 - type_1)
	(pred_3 ?v2 - type_3 ?v8 - type_3)
	(pred_5 ?v4 - type_2)
	(pred_1 ?v4 - type_2))                                                                                           
(:action op_1 
        :parameters (?v1 - type_3 ?v5 - type_3 ?v7 - type_5)
        :precondition (and (pred_4 ?v7 ?v1) 
                           (pred_3 ?v1 ?v5))                                                          
        :effect (and (not (pred_4 ?v7 ?v1)) (pred_4 ?v7 ?v5)))

(:action op_3 
        :parameters (?v6 - type_3 ?v3 - type_1 ?v7 - type_5)
        :precondition (and (pred_4 ?v7 ?v6) 
                           (pred_4 ?v3 ?v6))
        :effect (and (not (pred_4 ?v3 ?v6))
                     (pred_2 ?v7 ?v3)))

(:action op_2 
        :parameters (?v6 - type_3 ?v3 - type_1 ?v7 - type_5 ?v4 - type_2)
        :precondition (and (pred_4 ?v7 ?v6) 
		      	   (pred_4 ?v4 ?v6)
			   (pred_2 ?v7 ?v3)
			   (pred_6 ?v3)
			   (pred_1 ?v4))
        :effect (and (not (pred_1 ?v4))(not (pred_6 ?v3)) (pred_5 ?v4)))
)