(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_4 type_2 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v4 - type_1 ?v3 - type_5)
	(pred_5 ?v4 - type_4 ?v8 - type_3)
	(pred_2 ?v8 - type_3)
	(pred_1 ?v6 - type_5 ?v7 - type_5)
	(pred_4 ?v2 - type_2)
	(pred_3 ?v2 - type_2))                                                                                           
(:action op_1 
        :parameters (?v1 - type_5 ?v5 - type_5 ?v4 - type_4)
        :precondition (and (pred_6 ?v4 ?v1) 
                           (pred_1 ?v1 ?v5))                                                          
        :effect (and (not (pred_6 ?v4 ?v1)) (pred_6 ?v4 ?v5)))

(:action op_3 
        :parameters (?v3 - type_5 ?v8 - type_3 ?v4 - type_4)
        :precondition (and (pred_6 ?v4 ?v3) 
                           (pred_6 ?v8 ?v3))
        :effect (and (not (pred_6 ?v8 ?v3))
                     (pred_5 ?v4 ?v8)))

(:action op_2 
        :parameters (?v3 - type_5 ?v8 - type_3 ?v4 - type_4 ?v2 - type_2)
        :precondition (and (pred_6 ?v4 ?v3) 
		      	   (pred_6 ?v2 ?v3)
			   (pred_5 ?v4 ?v8)
			   (pred_2 ?v8)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_2 ?v8)) (pred_4 ?v2)))
)