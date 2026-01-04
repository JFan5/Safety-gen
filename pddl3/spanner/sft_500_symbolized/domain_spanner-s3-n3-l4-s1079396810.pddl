(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_5 type_4 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v1 - type_2 ?v4 - type_1)
	(pred_2 ?v1 - type_5 ?v7 - type_3)
	(pred_5 ?v7 - type_3)
	(pred_6 ?v3 - type_1 ?v6 - type_1)
	(pred_3 ?v8 - type_4)
	(pred_1 ?v8 - type_4))                                                                                           
(:action op_3 
        :parameters (?v5 - type_1 ?v2 - type_1 ?v1 - type_5)
        :precondition (and (pred_4 ?v1 ?v5) 
                           (pred_6 ?v5 ?v2))                                                          
        :effect (and (not (pred_4 ?v1 ?v5)) (pred_4 ?v1 ?v2)))

(:action op_1 
        :parameters (?v4 - type_1 ?v7 - type_3 ?v1 - type_5)
        :precondition (and (pred_4 ?v1 ?v4) 
                           (pred_4 ?v7 ?v4))
        :effect (and (not (pred_4 ?v7 ?v4))
                     (pred_2 ?v1 ?v7)))

(:action op_2 
        :parameters (?v4 - type_1 ?v7 - type_3 ?v1 - type_5 ?v8 - type_4)
        :precondition (and (pred_4 ?v1 ?v4) 
		      	   (pred_4 ?v8 ?v4)
			   (pred_2 ?v1 ?v7)
			   (pred_5 ?v7)
			   (pred_1 ?v8))
        :effect (and (not (pred_1 ?v8))(not (pred_5 ?v7)) (pred_3 ?v8)))
)