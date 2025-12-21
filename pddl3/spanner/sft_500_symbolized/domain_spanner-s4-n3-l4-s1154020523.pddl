(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_1 type_2 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v1 - type_4 ?v4 - type_3)
	(pred_6 ?v1 - type_1 ?v8 - type_5)
	(pred_2 ?v8 - type_5)
	(pred_3 ?v2 - type_3 ?v5 - type_3)
	(pred_1 ?v7 - type_2)
	(pred_4 ?v7 - type_2))                                                                                           
(:action op_3 
        :parameters (?v6 - type_3 ?v3 - type_3 ?v1 - type_1)
        :precondition (and (pred_5 ?v1 ?v6) 
                           (pred_3 ?v6 ?v3))                                                          
        :effect (and (not (pred_5 ?v1 ?v6)) (pred_5 ?v1 ?v3)))

(:action op_2 
        :parameters (?v4 - type_3 ?v8 - type_5 ?v1 - type_1)
        :precondition (and (pred_5 ?v1 ?v4) 
                           (pred_5 ?v8 ?v4))
        :effect (and (not (pred_5 ?v8 ?v4))
                     (pred_6 ?v1 ?v8)))

(:action op_1 
        :parameters (?v4 - type_3 ?v8 - type_5 ?v1 - type_1 ?v7 - type_2)
        :precondition (and (pred_5 ?v1 ?v4) 
		      	   (pred_5 ?v7 ?v4)
			   (pred_6 ?v1 ?v8)
			   (pred_2 ?v8)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_2 ?v8)) (pred_1 ?v7)))
)