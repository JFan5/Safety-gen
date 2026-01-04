(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_5 type_2 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v2 - type_4 ?v8 - type_3)
	(pred_6 ?v2 - type_5 ?v4 - type_1)
	(pred_3 ?v4 - type_1)
	(pred_4 ?v5 - type_3 ?v6 - type_3)
	(pred_5 ?v1 - type_2)
	(pred_1 ?v1 - type_2))                                                                                           
(:action op_2 
        :parameters (?v7 - type_3 ?v3 - type_3 ?v2 - type_5)
        :precondition (and (pred_2 ?v2 ?v7) 
                           (pred_4 ?v7 ?v3))                                                          
        :effect (and (not (pred_2 ?v2 ?v7)) (pred_2 ?v2 ?v3)))

(:action op_3 
        :parameters (?v8 - type_3 ?v4 - type_1 ?v2 - type_5)
        :precondition (and (pred_2 ?v2 ?v8) 
                           (pred_2 ?v4 ?v8))
        :effect (and (not (pred_2 ?v4 ?v8))
                     (pred_6 ?v2 ?v4)))

(:action op_1 
        :parameters (?v8 - type_3 ?v4 - type_1 ?v2 - type_5 ?v1 - type_2)
        :precondition (and (pred_2 ?v2 ?v8) 
		      	   (pred_2 ?v1 ?v8)
			   (pred_6 ?v2 ?v4)
			   (pred_3 ?v4)
			   (pred_1 ?v1))
        :effect (and (not (pred_1 ?v1))(not (pred_3 ?v4)) (pred_5 ?v1)))
)