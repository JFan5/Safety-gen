(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_2 type_4 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v3 - type_3 ?v5 - type_1)
	(pred_3 ?v3 - type_2 ?v1 - type_5)
	(pred_6 ?v1 - type_5)
	(pred_4 ?v7 - type_1 ?v6 - type_1)
	(pred_1 ?v8 - type_4)
	(pred_2 ?v8 - type_4))                                                                                           
(:action op_2 
        :parameters (?v4 - type_1 ?v2 - type_1 ?v3 - type_2)
        :precondition (and (pred_5 ?v3 ?v4) 
                           (pred_4 ?v4 ?v2))                                                          
        :effect (and (not (pred_5 ?v3 ?v4)) (pred_5 ?v3 ?v2)))

(:action op_3 
        :parameters (?v5 - type_1 ?v1 - type_5 ?v3 - type_2)
        :precondition (and (pred_5 ?v3 ?v5) 
                           (pred_5 ?v1 ?v5))
        :effect (and (not (pred_5 ?v1 ?v5))
                     (pred_3 ?v3 ?v1)))

(:action op_1 
        :parameters (?v5 - type_1 ?v1 - type_5 ?v3 - type_2 ?v8 - type_4)
        :precondition (and (pred_5 ?v3 ?v5) 
		      	   (pred_5 ?v8 ?v5)
			   (pred_3 ?v3 ?v1)
			   (pred_6 ?v1)
			   (pred_2 ?v8))
        :effect (and (not (pred_2 ?v8))(not (pred_6 ?v1)) (pred_1 ?v8)))
)