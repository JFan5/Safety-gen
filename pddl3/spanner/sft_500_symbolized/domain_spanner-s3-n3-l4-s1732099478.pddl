(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_1 type_4 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_2 ?v1 - type_5)
	(pred_1 ?v5 - type_1 ?v7 - type_3)
	(pred_5 ?v7 - type_3)
	(pred_2 ?v2 - type_5 ?v3 - type_5)
	(pred_6 ?v4 - type_4)
	(pred_3 ?v4 - type_4))                                                                                           
(:action op_1 
        :parameters (?v6 - type_5 ?v8 - type_5 ?v5 - type_1)
        :precondition (and (pred_4 ?v5 ?v6) 
                           (pred_2 ?v6 ?v8))                                                          
        :effect (and (not (pred_4 ?v5 ?v6)) (pred_4 ?v5 ?v8)))

(:action op_2 
        :parameters (?v1 - type_5 ?v7 - type_3 ?v5 - type_1)
        :precondition (and (pred_4 ?v5 ?v1) 
                           (pred_4 ?v7 ?v1))
        :effect (and (not (pred_4 ?v7 ?v1))
                     (pred_1 ?v5 ?v7)))

(:action op_3 
        :parameters (?v1 - type_5 ?v7 - type_3 ?v5 - type_1 ?v4 - type_4)
        :precondition (and (pred_4 ?v5 ?v1) 
		      	   (pred_4 ?v4 ?v1)
			   (pred_1 ?v5 ?v7)
			   (pred_5 ?v7)
			   (pred_3 ?v4))
        :effect (and (not (pred_3 ?v4))(not (pred_5 ?v7)) (pred_6 ?v4)))
)