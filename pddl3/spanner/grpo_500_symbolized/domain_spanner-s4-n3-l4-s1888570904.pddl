(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_1 type_2 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v1 - type_4 ?v2 - type_3)
	(pred_5 ?v1 - type_1 ?v3 - type_5)
	(pred_1 ?v3 - type_5)
	(pred_4 ?v7 - type_3 ?v6 - type_3)
	(pred_3 ?v8 - type_2)
	(pred_2 ?v8 - type_2))                                                                                           
(:action op_2 
        :parameters (?v4 - type_3 ?v5 - type_3 ?v1 - type_1)
        :precondition (and (pred_6 ?v1 ?v4) 
                           (pred_4 ?v4 ?v5))                                                          
        :effect (and (not (pred_6 ?v1 ?v4)) (pred_6 ?v1 ?v5)))

(:action op_3 
        :parameters (?v2 - type_3 ?v3 - type_5 ?v1 - type_1)
        :precondition (and (pred_6 ?v1 ?v2) 
                           (pred_6 ?v3 ?v2))
        :effect (and (not (pred_6 ?v3 ?v2))
                     (pred_5 ?v1 ?v3)))

(:action op_1 
        :parameters (?v2 - type_3 ?v3 - type_5 ?v1 - type_1 ?v8 - type_2)
        :precondition (and (pred_6 ?v1 ?v2) 
		      	   (pred_6 ?v8 ?v2)
			   (pred_5 ?v1 ?v3)
			   (pred_1 ?v3)
			   (pred_2 ?v8))
        :effect (and (not (pred_2 ?v8))(not (pred_1 ?v3)) (pred_3 ?v8)))
)