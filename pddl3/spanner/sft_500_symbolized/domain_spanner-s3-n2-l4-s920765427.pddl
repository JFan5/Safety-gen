(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_3 type_5 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v8 - type_2 ?v1 - type_1)
	(pred_5 ?v8 - type_3 ?v7 - type_4)
	(pred_1 ?v7 - type_4)
	(pred_3 ?v6 - type_1 ?v3 - type_1)
	(pred_6 ?v2 - type_5)
	(pred_4 ?v2 - type_5))                                                                                           
(:action op_2 
        :parameters (?v5 - type_1 ?v4 - type_1 ?v8 - type_3)
        :precondition (and (pred_2 ?v8 ?v5) 
                           (pred_3 ?v5 ?v4))                                                          
        :effect (and (not (pred_2 ?v8 ?v5)) (pred_2 ?v8 ?v4)))

(:action op_1 
        :parameters (?v1 - type_1 ?v7 - type_4 ?v8 - type_3)
        :precondition (and (pred_2 ?v8 ?v1) 
                           (pred_2 ?v7 ?v1))
        :effect (and (not (pred_2 ?v7 ?v1))
                     (pred_5 ?v8 ?v7)))

(:action op_3 
        :parameters (?v1 - type_1 ?v7 - type_4 ?v8 - type_3 ?v2 - type_5)
        :precondition (and (pred_2 ?v8 ?v1) 
		      	   (pred_2 ?v2 ?v1)
			   (pred_5 ?v8 ?v7)
			   (pred_1 ?v7)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_1 ?v7)) (pred_6 ?v2)))
)