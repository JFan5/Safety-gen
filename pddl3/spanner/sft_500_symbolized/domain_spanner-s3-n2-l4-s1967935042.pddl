(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_4 type_5 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v3 - type_3 ?v2 - type_1)
	(pred_5 ?v3 - type_4 ?v8 - type_2)
	(pred_2 ?v8 - type_2)
	(pred_4 ?v7 - type_1 ?v6 - type_1)
	(pred_3 ?v5 - type_5)
	(pred_1 ?v5 - type_5))                                                                                           
(:action op_3 
        :parameters (?v1 - type_1 ?v4 - type_1 ?v3 - type_4)
        :precondition (and (pred_6 ?v3 ?v1) 
                           (pred_4 ?v1 ?v4))                                                          
        :effect (and (not (pred_6 ?v3 ?v1)) (pred_6 ?v3 ?v4)))

(:action op_1 
        :parameters (?v2 - type_1 ?v8 - type_2 ?v3 - type_4)
        :precondition (and (pred_6 ?v3 ?v2) 
                           (pred_6 ?v8 ?v2))
        :effect (and (not (pred_6 ?v8 ?v2))
                     (pred_5 ?v3 ?v8)))

(:action op_2 
        :parameters (?v2 - type_1 ?v8 - type_2 ?v3 - type_4 ?v5 - type_5)
        :precondition (and (pred_6 ?v3 ?v2) 
		      	   (pred_6 ?v5 ?v2)
			   (pred_5 ?v3 ?v8)
			   (pred_2 ?v8)
			   (pred_1 ?v5))
        :effect (and (not (pred_1 ?v5))(not (pred_2 ?v8)) (pred_3 ?v5)))
)