(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_4 type_5 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_1 ?v5 - type_2)
	(pred_4 ?v7 - type_4 ?v8 - type_3)
	(pred_5 ?v8 - type_3)
	(pred_6 ?v6 - type_2 ?v3 - type_2)
	(pred_1 ?v2 - type_5)
	(pred_3 ?v2 - type_5))                                                                                           
(:action op_3 
        :parameters (?v4 - type_2 ?v1 - type_2 ?v7 - type_4)
        :precondition (and (pred_2 ?v7 ?v4) 
                           (pred_6 ?v4 ?v1))                                                          
        :effect (and (not (pred_2 ?v7 ?v4)) (pred_2 ?v7 ?v1)))

(:action op_1 
        :parameters (?v5 - type_2 ?v8 - type_3 ?v7 - type_4)
        :precondition (and (pred_2 ?v7 ?v5) 
                           (pred_2 ?v8 ?v5))
        :effect (and (not (pred_2 ?v8 ?v5))
                     (pred_4 ?v7 ?v8)))

(:action op_2 
        :parameters (?v5 - type_2 ?v8 - type_3 ?v7 - type_4 ?v2 - type_5)
        :precondition (and (pred_2 ?v7 ?v5) 
		      	   (pred_2 ?v2 ?v5)
			   (pred_4 ?v7 ?v8)
			   (pred_5 ?v8)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_5 ?v8)) (pred_1 ?v2)))
)