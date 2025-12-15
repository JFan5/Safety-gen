(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_4 type_2 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v2 - type_3 ?v5 - type_1)
	(pred_3 ?v2 - type_4 ?v3 - type_5)
	(pred_1 ?v3 - type_5)
	(pred_2 ?v8 - type_1 ?v1 - type_1)
	(pred_5 ?v7 - type_2)
	(pred_4 ?v7 - type_2))                                                                                           
(:action op_3 
        :parameters (?v4 - type_1 ?v6 - type_1 ?v2 - type_4)
        :precondition (and (pred_6 ?v2 ?v4) 
                           (pred_2 ?v4 ?v6))                                                          
        :effect (and (not (pred_6 ?v2 ?v4)) (pred_6 ?v2 ?v6)))

(:action op_2 
        :parameters (?v5 - type_1 ?v3 - type_5 ?v2 - type_4)
        :precondition (and (pred_6 ?v2 ?v5) 
                           (pred_6 ?v3 ?v5))
        :effect (and (not (pred_6 ?v3 ?v5))
                     (pred_3 ?v2 ?v3)))

(:action op_1 
        :parameters (?v5 - type_1 ?v3 - type_5 ?v2 - type_4 ?v7 - type_2)
        :precondition (and (pred_6 ?v2 ?v5) 
		      	   (pred_6 ?v7 ?v5)
			   (pred_3 ?v2 ?v3)
			   (pred_1 ?v3)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_1 ?v3)) (pred_5 ?v7)))
)