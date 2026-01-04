(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_1 type_5 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v7 - type_4 ?v3 - type_2)
	(pred_2 ?v7 - type_1 ?v4 - type_3)
	(pred_3 ?v4 - type_3)
	(pred_5 ?v5 - type_2 ?v1 - type_2)
	(pred_6 ?v8 - type_5)
	(pred_4 ?v8 - type_5))                                                                                           
(:action op_2 
        :parameters (?v6 - type_2 ?v2 - type_2 ?v7 - type_1)
        :precondition (and (pred_1 ?v7 ?v6) 
                           (pred_5 ?v6 ?v2))                                                          
        :effect (and (not (pred_1 ?v7 ?v6)) (pred_1 ?v7 ?v2)))

(:action op_1 
        :parameters (?v3 - type_2 ?v4 - type_3 ?v7 - type_1)
        :precondition (and (pred_1 ?v7 ?v3) 
                           (pred_1 ?v4 ?v3))
        :effect (and (not (pred_1 ?v4 ?v3))
                     (pred_2 ?v7 ?v4)))

(:action op_3 
        :parameters (?v3 - type_2 ?v4 - type_3 ?v7 - type_1 ?v8 - type_5)
        :precondition (and (pred_1 ?v7 ?v3) 
		      	   (pred_1 ?v8 ?v3)
			   (pred_2 ?v7 ?v4)
			   (pred_3 ?v4)
			   (pred_4 ?v8))
        :effect (and (not (pred_4 ?v8))(not (pred_3 ?v4)) (pred_6 ?v8)))
)