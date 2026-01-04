(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_4 type_3 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v5 - type_2 ?v7 - type_5)
	(pred_3 ?v5 - type_4 ?v4 - type_1)
	(pred_1 ?v4 - type_1)
	(pred_6 ?v3 - type_5 ?v6 - type_5)
	(pred_5 ?v1 - type_3)
	(pred_4 ?v1 - type_3))                                                                                           
(:action op_2 
        :parameters (?v8 - type_5 ?v2 - type_5 ?v5 - type_4)
        :precondition (and (pred_2 ?v5 ?v8) 
                           (pred_6 ?v8 ?v2))                                                          
        :effect (and (not (pred_2 ?v5 ?v8)) (pred_2 ?v5 ?v2)))

(:action op_1 
        :parameters (?v7 - type_5 ?v4 - type_1 ?v5 - type_4)
        :precondition (and (pred_2 ?v5 ?v7) 
                           (pred_2 ?v4 ?v7))
        :effect (and (not (pred_2 ?v4 ?v7))
                     (pred_3 ?v5 ?v4)))

(:action op_3 
        :parameters (?v7 - type_5 ?v4 - type_1 ?v5 - type_4 ?v1 - type_3)
        :precondition (and (pred_2 ?v5 ?v7) 
		      	   (pred_2 ?v1 ?v7)
			   (pred_3 ?v5 ?v4)
			   (pred_1 ?v4)
			   (pred_4 ?v1))
        :effect (and (not (pred_4 ?v1))(not (pred_1 ?v4)) (pred_5 ?v1)))
)