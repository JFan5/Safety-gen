(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_1 type_2 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v7 - type_5 ?v8 - type_4)
	(pred_6 ?v7 - type_1 ?v5 - type_3)
	(pred_2 ?v5 - type_3)
	(pred_1 ?v6 - type_4 ?v1 - type_4)
	(pred_3 ?v2 - type_2)
	(pred_4 ?v2 - type_2))                                                                                           
(:action op_3 
        :parameters (?v4 - type_4 ?v3 - type_4 ?v7 - type_1)
        :precondition (and (pred_5 ?v7 ?v4) 
                           (pred_1 ?v4 ?v3))                                                          
        :effect (and (not (pred_5 ?v7 ?v4)) (pred_5 ?v7 ?v3)))

(:action op_1 
        :parameters (?v8 - type_4 ?v5 - type_3 ?v7 - type_1)
        :precondition (and (pred_5 ?v7 ?v8) 
                           (pred_5 ?v5 ?v8))
        :effect (and (not (pred_5 ?v5 ?v8))
                     (pred_6 ?v7 ?v5)))

(:action op_2 
        :parameters (?v8 - type_4 ?v5 - type_3 ?v7 - type_1 ?v2 - type_2)
        :precondition (and (pred_5 ?v7 ?v8) 
		      	   (pred_5 ?v2 ?v8)
			   (pred_6 ?v7 ?v5)
			   (pred_2 ?v5)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_2 ?v5)) (pred_3 ?v2)))
)