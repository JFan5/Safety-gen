(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_1 type_2 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_5 ?v3 - type_3)
	(pred_5 ?v7 - type_1 ?v8 - type_4)
	(pred_6 ?v8 - type_4)
	(pred_3 ?v5 - type_3 ?v6 - type_3)
	(pred_1 ?v2 - type_2)
	(pred_4 ?v2 - type_2))                                                                                           
(:action op_2 
        :parameters (?v1 - type_3 ?v4 - type_3 ?v7 - type_1)
        :precondition (and (pred_2 ?v7 ?v1) 
                           (pred_3 ?v1 ?v4))                                                          
        :effect (and (not (pred_2 ?v7 ?v1)) (pred_2 ?v7 ?v4)))

(:action op_1 
        :parameters (?v3 - type_3 ?v8 - type_4 ?v7 - type_1)
        :precondition (and (pred_2 ?v7 ?v3) 
                           (pred_2 ?v8 ?v3))
        :effect (and (not (pred_2 ?v8 ?v3))
                     (pred_5 ?v7 ?v8)))

(:action op_3 
        :parameters (?v3 - type_3 ?v8 - type_4 ?v7 - type_1 ?v2 - type_2)
        :precondition (and (pred_2 ?v7 ?v3) 
		      	   (pred_2 ?v2 ?v3)
			   (pred_5 ?v7 ?v8)
			   (pred_6 ?v8)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_6 ?v8)) (pred_1 ?v2)))
)