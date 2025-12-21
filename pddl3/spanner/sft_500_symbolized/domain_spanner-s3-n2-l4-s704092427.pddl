(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_2 type_4 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_5 ?v2 - type_1)
	(pred_1 ?v7 - type_2 ?v8 - type_3)
	(pred_3 ?v8 - type_3)
	(pred_6 ?v1 - type_1 ?v3 - type_1)
	(pred_5 ?v4 - type_4)
	(pred_4 ?v4 - type_4))                                                                                           
(:action op_1 
        :parameters (?v6 - type_1 ?v5 - type_1 ?v7 - type_2)
        :precondition (and (pred_2 ?v7 ?v6) 
                           (pred_6 ?v6 ?v5))                                                          
        :effect (and (not (pred_2 ?v7 ?v6)) (pred_2 ?v7 ?v5)))

(:action op_2 
        :parameters (?v2 - type_1 ?v8 - type_3 ?v7 - type_2)
        :precondition (and (pred_2 ?v7 ?v2) 
                           (pred_2 ?v8 ?v2))
        :effect (and (not (pred_2 ?v8 ?v2))
                     (pred_1 ?v7 ?v8)))

(:action op_3 
        :parameters (?v2 - type_1 ?v8 - type_3 ?v7 - type_2 ?v4 - type_4)
        :precondition (and (pred_2 ?v7 ?v2) 
		      	   (pred_2 ?v4 ?v2)
			   (pred_1 ?v7 ?v8)
			   (pred_3 ?v8)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_3 ?v8)) (pred_5 ?v4)))
)