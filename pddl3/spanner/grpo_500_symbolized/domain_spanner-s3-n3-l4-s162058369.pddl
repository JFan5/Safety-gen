(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_2 type_5 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v8 - type_1 ?v5 - type_3)
	(pred_3 ?v8 - type_2 ?v1 - type_4)
	(pred_4 ?v1 - type_4)
	(pred_2 ?v6 - type_3 ?v2 - type_3)
	(pred_1 ?v7 - type_5)
	(pred_5 ?v7 - type_5))                                                                                           
(:action op_3 
        :parameters (?v4 - type_3 ?v3 - type_3 ?v8 - type_2)
        :precondition (and (pred_6 ?v8 ?v4) 
                           (pred_2 ?v4 ?v3))                                                          
        :effect (and (not (pred_6 ?v8 ?v4)) (pred_6 ?v8 ?v3)))

(:action op_2 
        :parameters (?v5 - type_3 ?v1 - type_4 ?v8 - type_2)
        :precondition (and (pred_6 ?v8 ?v5) 
                           (pred_6 ?v1 ?v5))
        :effect (and (not (pred_6 ?v1 ?v5))
                     (pred_3 ?v8 ?v1)))

(:action op_1 
        :parameters (?v5 - type_3 ?v1 - type_4 ?v8 - type_2 ?v7 - type_5)
        :precondition (and (pred_6 ?v8 ?v5) 
		      	   (pred_6 ?v7 ?v5)
			   (pred_3 ?v8 ?v1)
			   (pred_4 ?v1)
			   (pred_5 ?v7))
        :effect (and (not (pred_5 ?v7))(not (pred_4 ?v1)) (pred_1 ?v7)))
)