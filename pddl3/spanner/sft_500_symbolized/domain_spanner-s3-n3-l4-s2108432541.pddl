(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_2 type_1 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v4 - type_4 ?v5 - type_3)
	(pred_5 ?v4 - type_2 ?v8 - type_5)
	(pred_4 ?v8 - type_5)
	(pred_2 ?v7 - type_3 ?v6 - type_3)
	(pred_3 ?v1 - type_1)
	(pred_1 ?v1 - type_1))                                                                                           
(:action op_3 
        :parameters (?v3 - type_3 ?v2 - type_3 ?v4 - type_2)
        :precondition (and (pred_6 ?v4 ?v3) 
                           (pred_2 ?v3 ?v2))                                                          
        :effect (and (not (pred_6 ?v4 ?v3)) (pred_6 ?v4 ?v2)))

(:action op_2 
        :parameters (?v5 - type_3 ?v8 - type_5 ?v4 - type_2)
        :precondition (and (pred_6 ?v4 ?v5) 
                           (pred_6 ?v8 ?v5))
        :effect (and (not (pred_6 ?v8 ?v5))
                     (pred_5 ?v4 ?v8)))

(:action op_1 
        :parameters (?v5 - type_3 ?v8 - type_5 ?v4 - type_2 ?v1 - type_1)
        :precondition (and (pred_6 ?v4 ?v5) 
		      	   (pred_6 ?v1 ?v5)
			   (pred_5 ?v4 ?v8)
			   (pred_4 ?v8)
			   (pred_1 ?v1))
        :effect (and (not (pred_1 ?v1))(not (pred_4 ?v8)) (pred_3 ?v1)))
)