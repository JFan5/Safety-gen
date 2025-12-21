(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_1 type_2 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v1 - type_4 ?v7 - type_3)
	(pred_6 ?v1 - type_1 ?v4 - type_5)
	(pred_1 ?v4 - type_5)
	(pred_4 ?v2 - type_3 ?v5 - type_3)
	(pred_3 ?v3 - type_2)
	(pred_2 ?v3 - type_2))                                                                                           
(:action op_1 
        :parameters (?v6 - type_3 ?v8 - type_3 ?v1 - type_1)
        :precondition (and (pred_5 ?v1 ?v6) 
                           (pred_4 ?v6 ?v8))                                                          
        :effect (and (not (pred_5 ?v1 ?v6)) (pred_5 ?v1 ?v8)))

(:action op_2 
        :parameters (?v7 - type_3 ?v4 - type_5 ?v1 - type_1)
        :precondition (and (pred_5 ?v1 ?v7) 
                           (pred_5 ?v4 ?v7))
        :effect (and (not (pred_5 ?v4 ?v7))
                     (pred_6 ?v1 ?v4)))

(:action op_3 
        :parameters (?v7 - type_3 ?v4 - type_5 ?v1 - type_1 ?v3 - type_2)
        :precondition (and (pred_5 ?v1 ?v7) 
		      	   (pred_5 ?v3 ?v7)
			   (pred_6 ?v1 ?v4)
			   (pred_1 ?v4)
			   (pred_2 ?v3))
        :effect (and (not (pred_2 ?v3))(not (pred_1 ?v4)) (pred_3 ?v3)))
)