(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_1 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v3 - type_3 ?v4 - type_2)
	(pred_6 ?v3 - type_1 ?v7 - type_4)
	(pred_5 ?v7 - type_4)
	(pred_2 ?v1 - type_2 ?v2 - type_2)
	(pred_3 ?v5 - type_5)
	(pred_1 ?v5 - type_5))                                                                                           
(:action op_1 
        :parameters (?v8 - type_2 ?v6 - type_2 ?v3 - type_1)
        :precondition (and (pred_4 ?v3 ?v8) 
                           (pred_2 ?v8 ?v6))                                                          
        :effect (and (not (pred_4 ?v3 ?v8)) (pred_4 ?v3 ?v6)))

(:action op_3 
        :parameters (?v4 - type_2 ?v7 - type_4 ?v3 - type_1)
        :precondition (and (pred_4 ?v3 ?v4) 
                           (pred_4 ?v7 ?v4))
        :effect (and (not (pred_4 ?v7 ?v4))
                     (pred_6 ?v3 ?v7)))

(:action op_2 
        :parameters (?v4 - type_2 ?v7 - type_4 ?v3 - type_1 ?v5 - type_5)
        :precondition (and (pred_4 ?v3 ?v4) 
		      	   (pred_4 ?v5 ?v4)
			   (pred_6 ?v3 ?v7)
			   (pred_5 ?v7)
			   (pred_1 ?v5))
        :effect (and (not (pred_1 ?v5))(not (pred_5 ?v7)) (pred_3 ?v5)))
)