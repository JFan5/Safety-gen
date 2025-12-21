(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_1 type_2 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v4 - type_5 ?v2 - type_4)
	(pred_3 ?v4 - type_1 ?v7 - type_3)
	(pred_2 ?v7 - type_3)
	(pred_1 ?v6 - type_4 ?v3 - type_4)
	(pred_5 ?v8 - type_2)
	(pred_4 ?v8 - type_2))                                                                                           
(:action op_2 
        :parameters (?v5 - type_4 ?v1 - type_4 ?v4 - type_1)
        :precondition (and (pred_6 ?v4 ?v5) 
                           (pred_1 ?v5 ?v1))                                                          
        :effect (and (not (pred_6 ?v4 ?v5)) (pred_6 ?v4 ?v1)))

(:action op_3 
        :parameters (?v2 - type_4 ?v7 - type_3 ?v4 - type_1)
        :precondition (and (pred_6 ?v4 ?v2) 
                           (pred_6 ?v7 ?v2))
        :effect (and (not (pred_6 ?v7 ?v2))
                     (pred_3 ?v4 ?v7)))

(:action op_1 
        :parameters (?v2 - type_4 ?v7 - type_3 ?v4 - type_1 ?v8 - type_2)
        :precondition (and (pred_6 ?v4 ?v2) 
		      	   (pred_6 ?v8 ?v2)
			   (pred_3 ?v4 ?v7)
			   (pred_2 ?v7)
			   (pred_4 ?v8))
        :effect (and (not (pred_4 ?v8))(not (pred_2 ?v7)) (pred_5 ?v8)))
)