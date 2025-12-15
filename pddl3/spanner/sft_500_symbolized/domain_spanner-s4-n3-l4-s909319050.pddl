(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_2 type_3 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_5 ?v5 - type_1)
	(pred_1 ?v4 - type_2 ?v7 - type_4)
	(pred_4 ?v7 - type_4)
	(pred_3 ?v6 - type_1 ?v1 - type_1)
	(pred_6 ?v8 - type_3)
	(pred_5 ?v8 - type_3))                                                                                           
(:action op_1 
        :parameters (?v3 - type_1 ?v2 - type_1 ?v4 - type_2)
        :precondition (and (pred_2 ?v4 ?v3) 
                           (pred_3 ?v3 ?v2))                                                          
        :effect (and (not (pred_2 ?v4 ?v3)) (pred_2 ?v4 ?v2)))

(:action op_3 
        :parameters (?v5 - type_1 ?v7 - type_4 ?v4 - type_2)
        :precondition (and (pred_2 ?v4 ?v5) 
                           (pred_2 ?v7 ?v5))
        :effect (and (not (pred_2 ?v7 ?v5))
                     (pred_1 ?v4 ?v7)))

(:action op_2 
        :parameters (?v5 - type_1 ?v7 - type_4 ?v4 - type_2 ?v8 - type_3)
        :precondition (and (pred_2 ?v4 ?v5) 
		      	   (pred_2 ?v8 ?v5)
			   (pred_1 ?v4 ?v7)
			   (pred_4 ?v7)
			   (pred_5 ?v8))
        :effect (and (not (pred_5 ?v8))(not (pred_4 ?v7)) (pred_6 ?v8)))
)