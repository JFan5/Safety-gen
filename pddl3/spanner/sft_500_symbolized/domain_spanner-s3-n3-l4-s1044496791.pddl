(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_2 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_5 ?v2 - type_4)
	(pred_4 ?v8 - type_2 ?v4 - type_3)
	(pred_1 ?v4 - type_3)
	(pred_2 ?v3 - type_4 ?v1 - type_4)
	(pred_3 ?v7 - type_1)
	(pred_6 ?v7 - type_1))                                                                                           
(:action op_3 
        :parameters (?v5 - type_4 ?v6 - type_4 ?v8 - type_2)
        :precondition (and (pred_5 ?v8 ?v5) 
                           (pred_2 ?v5 ?v6))                                                          
        :effect (and (not (pred_5 ?v8 ?v5)) (pred_5 ?v8 ?v6)))

(:action op_1 
        :parameters (?v2 - type_4 ?v4 - type_3 ?v8 - type_2)
        :precondition (and (pred_5 ?v8 ?v2) 
                           (pred_5 ?v4 ?v2))
        :effect (and (not (pred_5 ?v4 ?v2))
                     (pred_4 ?v8 ?v4)))

(:action op_2 
        :parameters (?v2 - type_4 ?v4 - type_3 ?v8 - type_2 ?v7 - type_1)
        :precondition (and (pred_5 ?v8 ?v2) 
		      	   (pred_5 ?v7 ?v2)
			   (pred_4 ?v8 ?v4)
			   (pred_1 ?v4)
			   (pred_6 ?v7))
        :effect (and (not (pred_6 ?v7))(not (pred_1 ?v4)) (pred_3 ?v7)))
)