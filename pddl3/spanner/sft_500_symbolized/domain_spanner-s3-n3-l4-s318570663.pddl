(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_1 type_5 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_4 ?v8 - type_2)
	(pred_4 ?v4 - type_1 ?v3 - type_3)
	(pred_3 ?v3 - type_3)
	(pred_1 ?v6 - type_2 ?v1 - type_2)
	(pred_6 ?v2 - type_5)
	(pred_5 ?v2 - type_5))                                                                                           
(:action op_3 
        :parameters (?v5 - type_2 ?v7 - type_2 ?v4 - type_1)
        :precondition (and (pred_2 ?v4 ?v5) 
                           (pred_1 ?v5 ?v7))                                                          
        :effect (and (not (pred_2 ?v4 ?v5)) (pred_2 ?v4 ?v7)))

(:action op_1 
        :parameters (?v8 - type_2 ?v3 - type_3 ?v4 - type_1)
        :precondition (and (pred_2 ?v4 ?v8) 
                           (pred_2 ?v3 ?v8))
        :effect (and (not (pred_2 ?v3 ?v8))
                     (pred_4 ?v4 ?v3)))

(:action op_2 
        :parameters (?v8 - type_2 ?v3 - type_3 ?v4 - type_1 ?v2 - type_5)
        :precondition (and (pred_2 ?v4 ?v8) 
		      	   (pred_2 ?v2 ?v8)
			   (pred_4 ?v4 ?v3)
			   (pred_3 ?v3)
			   (pred_5 ?v2))
        :effect (and (not (pred_5 ?v2))(not (pred_3 ?v3)) (pred_6 ?v2)))
)