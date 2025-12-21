(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_1 type_3 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v3 - type_4 ?v1 - type_2)
	(pred_2 ?v3 - type_1 ?v8 - type_5)
	(pred_5 ?v8 - type_5)
	(pred_3 ?v2 - type_2 ?v6 - type_2)
	(pred_6 ?v5 - type_3)
	(pred_1 ?v5 - type_3))                                                                                           
(:action op_1 
        :parameters (?v4 - type_2 ?v7 - type_2 ?v3 - type_1)
        :precondition (and (pred_4 ?v3 ?v4) 
                           (pred_3 ?v4 ?v7))                                                          
        :effect (and (not (pred_4 ?v3 ?v4)) (pred_4 ?v3 ?v7)))

(:action op_3 
        :parameters (?v1 - type_2 ?v8 - type_5 ?v3 - type_1)
        :precondition (and (pred_4 ?v3 ?v1) 
                           (pred_4 ?v8 ?v1))
        :effect (and (not (pred_4 ?v8 ?v1))
                     (pred_2 ?v3 ?v8)))

(:action op_2 
        :parameters (?v1 - type_2 ?v8 - type_5 ?v3 - type_1 ?v5 - type_3)
        :precondition (and (pred_4 ?v3 ?v1) 
		      	   (pred_4 ?v5 ?v1)
			   (pred_2 ?v3 ?v8)
			   (pred_5 ?v8)
			   (pred_1 ?v5))
        :effect (and (not (pred_1 ?v5))(not (pred_5 ?v8)) (pred_6 ?v5)))
)