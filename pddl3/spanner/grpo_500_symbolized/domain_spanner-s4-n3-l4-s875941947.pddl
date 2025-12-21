(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_3 type_4 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v8 - type_5 ?v5 - type_1)
	(pred_3 ?v8 - type_3 ?v4 - type_2)
	(pred_6 ?v4 - type_2)
	(pred_5 ?v6 - type_1 ?v3 - type_1)
	(pred_4 ?v2 - type_4)
	(pred_1 ?v2 - type_4))                                                                                           
(:action op_1 
        :parameters (?v7 - type_1 ?v1 - type_1 ?v8 - type_3)
        :precondition (and (pred_2 ?v8 ?v7) 
                           (pred_5 ?v7 ?v1))                                                          
        :effect (and (not (pred_2 ?v8 ?v7)) (pred_2 ?v8 ?v1)))

(:action op_2 
        :parameters (?v5 - type_1 ?v4 - type_2 ?v8 - type_3)
        :precondition (and (pred_2 ?v8 ?v5) 
                           (pred_2 ?v4 ?v5))
        :effect (and (not (pred_2 ?v4 ?v5))
                     (pred_3 ?v8 ?v4)))

(:action op_3 
        :parameters (?v5 - type_1 ?v4 - type_2 ?v8 - type_3 ?v2 - type_4)
        :precondition (and (pred_2 ?v8 ?v5) 
		      	   (pred_2 ?v2 ?v5)
			   (pred_3 ?v8 ?v4)
			   (pred_6 ?v4)
			   (pred_1 ?v2))
        :effect (and (not (pred_1 ?v2))(not (pred_6 ?v4)) (pred_4 ?v2)))
)