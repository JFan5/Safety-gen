(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_2 type_5 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v4 - type_4 ?v5 - type_3)
	(pred_1 ?v4 - type_2 ?v2 - type_1)
	(pred_5 ?v2 - type_1)
	(pred_4 ?v6 - type_3 ?v3 - type_3)
	(pred_3 ?v1 - type_5)
	(pred_2 ?v1 - type_5))                                                                                           
(:action op_3 
        :parameters (?v7 - type_3 ?v8 - type_3 ?v4 - type_2)
        :precondition (and (pred_6 ?v4 ?v7) 
                           (pred_4 ?v7 ?v8))                                                          
        :effect (and (not (pred_6 ?v4 ?v7)) (pred_6 ?v4 ?v8)))

(:action op_1 
        :parameters (?v5 - type_3 ?v2 - type_1 ?v4 - type_2)
        :precondition (and (pred_6 ?v4 ?v5) 
                           (pred_6 ?v2 ?v5))
        :effect (and (not (pred_6 ?v2 ?v5))
                     (pred_1 ?v4 ?v2)))

(:action op_2 
        :parameters (?v5 - type_3 ?v2 - type_1 ?v4 - type_2 ?v1 - type_5)
        :precondition (and (pred_6 ?v4 ?v5) 
		      	   (pred_6 ?v1 ?v5)
			   (pred_1 ?v4 ?v2)
			   (pred_5 ?v2)
			   (pred_2 ?v1))
        :effect (and (not (pred_2 ?v1))(not (pred_5 ?v2)) (pred_3 ?v1)))
)