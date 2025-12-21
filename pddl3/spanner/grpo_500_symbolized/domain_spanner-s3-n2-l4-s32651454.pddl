(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_1 type_2 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v1 - type_5 ?v5 - type_4)
	(pred_5 ?v1 - type_1 ?v7 - type_3)
	(pred_6 ?v7 - type_3)
	(pred_1 ?v2 - type_4 ?v3 - type_4)
	(pred_3 ?v8 - type_2)
	(pred_2 ?v8 - type_2))                                                                                           
(:action op_1 
        :parameters (?v6 - type_4 ?v4 - type_4 ?v1 - type_1)
        :precondition (and (pred_4 ?v1 ?v6) 
                           (pred_1 ?v6 ?v4))                                                          
        :effect (and (not (pred_4 ?v1 ?v6)) (pred_4 ?v1 ?v4)))

(:action op_2 
        :parameters (?v5 - type_4 ?v7 - type_3 ?v1 - type_1)
        :precondition (and (pred_4 ?v1 ?v5) 
                           (pred_4 ?v7 ?v5))
        :effect (and (not (pred_4 ?v7 ?v5))
                     (pred_5 ?v1 ?v7)))

(:action op_3 
        :parameters (?v5 - type_4 ?v7 - type_3 ?v1 - type_1 ?v8 - type_2)
        :precondition (and (pred_4 ?v1 ?v5) 
		      	   (pred_4 ?v8 ?v5)
			   (pred_5 ?v1 ?v7)
			   (pred_6 ?v7)
			   (pred_2 ?v8))
        :effect (and (not (pred_2 ?v8))(not (pred_6 ?v7)) (pred_3 ?v8)))
)