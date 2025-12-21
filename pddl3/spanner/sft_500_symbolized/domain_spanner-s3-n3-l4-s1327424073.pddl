(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_2 type_1 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_4 ?v2 - type_3)
	(pred_6 ?v7 - type_2 ?v8 - type_5)
	(pred_1 ?v8 - type_5)
	(pred_3 ?v1 - type_3 ?v3 - type_3)
	(pred_4 ?v5 - type_1)
	(pred_5 ?v5 - type_1))                                                                                           
(:action op_2 
        :parameters (?v6 - type_3 ?v4 - type_3 ?v7 - type_2)
        :precondition (and (pred_2 ?v7 ?v6) 
                           (pred_3 ?v6 ?v4))                                                          
        :effect (and (not (pred_2 ?v7 ?v6)) (pred_2 ?v7 ?v4)))

(:action op_3 
        :parameters (?v2 - type_3 ?v8 - type_5 ?v7 - type_2)
        :precondition (and (pred_2 ?v7 ?v2) 
                           (pred_2 ?v8 ?v2))
        :effect (and (not (pred_2 ?v8 ?v2))
                     (pred_6 ?v7 ?v8)))

(:action op_1 
        :parameters (?v2 - type_3 ?v8 - type_5 ?v7 - type_2 ?v5 - type_1)
        :precondition (and (pred_2 ?v7 ?v2) 
		      	   (pred_2 ?v5 ?v2)
			   (pred_6 ?v7 ?v8)
			   (pred_1 ?v8)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_1 ?v8)) (pred_4 ?v5)))
)