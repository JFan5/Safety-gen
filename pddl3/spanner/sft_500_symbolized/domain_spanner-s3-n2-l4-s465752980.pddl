(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_2 type_1 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v1 - type_4 ?v8 - type_3)
	(pred_4 ?v1 - type_2 ?v7 - type_5)
	(pred_1 ?v7 - type_5)
	(pred_6 ?v3 - type_3 ?v6 - type_3)
	(pred_5 ?v5 - type_1)
	(pred_3 ?v5 - type_1))                                                                                           
(:action op_3 
        :parameters (?v2 - type_3 ?v4 - type_3 ?v1 - type_2)
        :precondition (and (pred_2 ?v1 ?v2) 
                           (pred_6 ?v2 ?v4))                                                          
        :effect (and (not (pred_2 ?v1 ?v2)) (pred_2 ?v1 ?v4)))

(:action op_1 
        :parameters (?v8 - type_3 ?v7 - type_5 ?v1 - type_2)
        :precondition (and (pred_2 ?v1 ?v8) 
                           (pred_2 ?v7 ?v8))
        :effect (and (not (pred_2 ?v7 ?v8))
                     (pred_4 ?v1 ?v7)))

(:action op_2 
        :parameters (?v8 - type_3 ?v7 - type_5 ?v1 - type_2 ?v5 - type_1)
        :precondition (and (pred_2 ?v1 ?v8) 
		      	   (pred_2 ?v5 ?v8)
			   (pred_4 ?v1 ?v7)
			   (pred_1 ?v7)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_1 ?v7)) (pred_5 ?v5)))
)