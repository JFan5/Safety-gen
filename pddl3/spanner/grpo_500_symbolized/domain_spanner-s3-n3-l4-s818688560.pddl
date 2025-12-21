(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_3 type_4 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_5 ?v2 - type_2)
	(pred_2 ?v1 - type_3 ?v7 - type_1)
	(pred_4 ?v7 - type_1)
	(pred_5 ?v5 - type_2 ?v6 - type_2)
	(pred_1 ?v8 - type_4)
	(pred_6 ?v8 - type_4))                                                                                           
(:action op_3 
        :parameters (?v4 - type_2 ?v3 - type_2 ?v1 - type_3)
        :precondition (and (pred_3 ?v1 ?v4) 
                           (pred_5 ?v4 ?v3))                                                          
        :effect (and (not (pred_3 ?v1 ?v4)) (pred_3 ?v1 ?v3)))

(:action op_2 
        :parameters (?v2 - type_2 ?v7 - type_1 ?v1 - type_3)
        :precondition (and (pred_3 ?v1 ?v2) 
                           (pred_3 ?v7 ?v2))
        :effect (and (not (pred_3 ?v7 ?v2))
                     (pred_2 ?v1 ?v7)))

(:action op_1 
        :parameters (?v2 - type_2 ?v7 - type_1 ?v1 - type_3 ?v8 - type_4)
        :precondition (and (pred_3 ?v1 ?v2) 
		      	   (pred_3 ?v8 ?v2)
			   (pred_2 ?v1 ?v7)
			   (pred_4 ?v7)
			   (pred_6 ?v8))
        :effect (and (not (pred_6 ?v8))(not (pred_4 ?v7)) (pred_1 ?v8)))
)