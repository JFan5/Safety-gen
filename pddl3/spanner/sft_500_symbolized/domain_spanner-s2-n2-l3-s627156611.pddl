(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_3 type_1 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_4 ?v3 - type_2)
	(pred_6 ?v5 - type_3 ?v7 - type_5)
	(pred_5 ?v7 - type_5)
	(pred_1 ?v6 - type_2 ?v2 - type_2)
	(pred_2 ?v1 - type_1)
	(pred_3 ?v1 - type_1))                                                                                           
(:action op_1 
        :parameters (?v8 - type_2 ?v4 - type_2 ?v5 - type_3)
        :precondition (and (pred_4 ?v5 ?v8) 
                           (pred_1 ?v8 ?v4))                                                          
        :effect (and (not (pred_4 ?v5 ?v8)) (pred_4 ?v5 ?v4)))

(:action op_2 
        :parameters (?v3 - type_2 ?v7 - type_5 ?v5 - type_3)
        :precondition (and (pred_4 ?v5 ?v3) 
                           (pred_4 ?v7 ?v3))
        :effect (and (not (pred_4 ?v7 ?v3))
                     (pred_6 ?v5 ?v7)))

(:action op_3 
        :parameters (?v3 - type_2 ?v7 - type_5 ?v5 - type_3 ?v1 - type_1)
        :precondition (and (pred_4 ?v5 ?v3) 
		      	   (pred_4 ?v1 ?v3)
			   (pred_6 ?v5 ?v7)
			   (pred_5 ?v7)
			   (pred_3 ?v1))
        :effect (and (not (pred_3 ?v1))(not (pred_5 ?v7)) (pred_2 ?v1)))
)