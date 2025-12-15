(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_4 type_5 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v1 - type_2 ?v8 - type_3)
	(pred_2 ?v1 - type_4 ?v7 - type_1)
	(pred_6 ?v7 - type_1)
	(pred_3 ?v6 - type_3 ?v3 - type_3)
	(pred_1 ?v4 - type_5)
	(pred_5 ?v4 - type_5))                                                                                           
(:action op_2 
        :parameters (?v5 - type_3 ?v2 - type_3 ?v1 - type_4)
        :precondition (and (pred_4 ?v1 ?v5) 
                           (pred_3 ?v5 ?v2))                                                          
        :effect (and (not (pred_4 ?v1 ?v5)) (pred_4 ?v1 ?v2)))

(:action op_1 
        :parameters (?v8 - type_3 ?v7 - type_1 ?v1 - type_4)
        :precondition (and (pred_4 ?v1 ?v8) 
                           (pred_4 ?v7 ?v8))
        :effect (and (not (pred_4 ?v7 ?v8))
                     (pred_2 ?v1 ?v7)))

(:action op_3 
        :parameters (?v8 - type_3 ?v7 - type_1 ?v1 - type_4 ?v4 - type_5)
        :precondition (and (pred_4 ?v1 ?v8) 
		      	   (pred_4 ?v4 ?v8)
			   (pred_2 ?v1 ?v7)
			   (pred_6 ?v7)
			   (pred_5 ?v4))
        :effect (and (not (pred_5 ?v4))(not (pred_6 ?v7)) (pred_1 ?v4)))
)