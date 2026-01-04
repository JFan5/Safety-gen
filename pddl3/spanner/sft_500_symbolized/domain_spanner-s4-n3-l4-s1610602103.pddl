(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_2 type_3 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v4 - type_1 ?v1 - type_5)
	(pred_6 ?v4 - type_2 ?v2 - type_4)
	(pred_2 ?v2 - type_4)
	(pred_5 ?v3 - type_5 ?v6 - type_5)
	(pred_1 ?v7 - type_3)
	(pred_4 ?v7 - type_3))                                                                                           
(:action op_2 
        :parameters (?v8 - type_5 ?v5 - type_5 ?v4 - type_2)
        :precondition (and (pred_3 ?v4 ?v8) 
                           (pred_5 ?v8 ?v5))                                                          
        :effect (and (not (pred_3 ?v4 ?v8)) (pred_3 ?v4 ?v5)))

(:action op_1 
        :parameters (?v1 - type_5 ?v2 - type_4 ?v4 - type_2)
        :precondition (and (pred_3 ?v4 ?v1) 
                           (pred_3 ?v2 ?v1))
        :effect (and (not (pred_3 ?v2 ?v1))
                     (pred_6 ?v4 ?v2)))

(:action op_3 
        :parameters (?v1 - type_5 ?v2 - type_4 ?v4 - type_2 ?v7 - type_3)
        :precondition (and (pred_3 ?v4 ?v1) 
		      	   (pred_3 ?v7 ?v1)
			   (pred_6 ?v4 ?v2)
			   (pred_2 ?v2)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_2 ?v2)) (pred_1 ?v7)))
)