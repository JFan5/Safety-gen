(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_4 type_5 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v7 - type_1 ?v8 - type_3)
	(pred_4 ?v7 - type_4 ?v3 - type_2)
	(pred_5 ?v3 - type_2)
	(pred_2 ?v5 - type_3 ?v1 - type_3)
	(pred_3 ?v2 - type_5)
	(pred_6 ?v2 - type_5))                                                                                           
(:action op_1 
        :parameters (?v4 - type_3 ?v6 - type_3 ?v7 - type_4)
        :precondition (and (pred_1 ?v7 ?v4) 
                           (pred_2 ?v4 ?v6))                                                          
        :effect (and (not (pred_1 ?v7 ?v4)) (pred_1 ?v7 ?v6)))

(:action op_2 
        :parameters (?v8 - type_3 ?v3 - type_2 ?v7 - type_4)
        :precondition (and (pred_1 ?v7 ?v8) 
                           (pred_1 ?v3 ?v8))
        :effect (and (not (pred_1 ?v3 ?v8))
                     (pred_4 ?v7 ?v3)))

(:action op_3 
        :parameters (?v8 - type_3 ?v3 - type_2 ?v7 - type_4 ?v2 - type_5)
        :precondition (and (pred_1 ?v7 ?v8) 
		      	   (pred_1 ?v2 ?v8)
			   (pred_4 ?v7 ?v3)
			   (pred_5 ?v3)
			   (pred_6 ?v2))
        :effect (and (not (pred_6 ?v2))(not (pred_5 ?v3)) (pred_3 ?v2)))
)