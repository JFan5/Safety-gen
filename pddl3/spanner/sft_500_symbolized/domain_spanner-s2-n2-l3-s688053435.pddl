(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_5 type_2 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v2 - type_3 ?v1 - type_4)
	(pred_3 ?v2 - type_5 ?v8 - type_1)
	(pred_4 ?v8 - type_1)
	(pred_1 ?v4 - type_4 ?v5 - type_4)
	(pred_5 ?v7 - type_2)
	(pred_6 ?v7 - type_2))                                                                                           
(:action op_2 
        :parameters (?v6 - type_4 ?v3 - type_4 ?v2 - type_5)
        :precondition (and (pred_2 ?v2 ?v6) 
                           (pred_1 ?v6 ?v3))                                                          
        :effect (and (not (pred_2 ?v2 ?v6)) (pred_2 ?v2 ?v3)))

(:action op_1 
        :parameters (?v1 - type_4 ?v8 - type_1 ?v2 - type_5)
        :precondition (and (pred_2 ?v2 ?v1) 
                           (pred_2 ?v8 ?v1))
        :effect (and (not (pred_2 ?v8 ?v1))
                     (pred_3 ?v2 ?v8)))

(:action op_3 
        :parameters (?v1 - type_4 ?v8 - type_1 ?v2 - type_5 ?v7 - type_2)
        :precondition (and (pred_2 ?v2 ?v1) 
		      	   (pred_2 ?v7 ?v1)
			   (pred_3 ?v2 ?v8)
			   (pred_4 ?v8)
			   (pred_6 ?v7))
        :effect (and (not (pred_6 ?v7))(not (pred_4 ?v8)) (pred_5 ?v7)))
)