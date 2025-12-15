(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_4 type_1 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v1 - type_3 ?v2 - type_5)
	(pred_6 ?v1 - type_4 ?v4 - type_2)
	(pred_5 ?v4 - type_2)
	(pred_3 ?v7 - type_5 ?v5 - type_5)
	(pred_2 ?v3 - type_1)
	(pred_4 ?v3 - type_1))                                                                                           
(:action op_2 
        :parameters (?v8 - type_5 ?v6 - type_5 ?v1 - type_4)
        :precondition (and (pred_1 ?v1 ?v8) 
                           (pred_3 ?v8 ?v6))                                                          
        :effect (and (not (pred_1 ?v1 ?v8)) (pred_1 ?v1 ?v6)))

(:action op_3 
        :parameters (?v2 - type_5 ?v4 - type_2 ?v1 - type_4)
        :precondition (and (pred_1 ?v1 ?v2) 
                           (pred_1 ?v4 ?v2))
        :effect (and (not (pred_1 ?v4 ?v2))
                     (pred_6 ?v1 ?v4)))

(:action op_1 
        :parameters (?v2 - type_5 ?v4 - type_2 ?v1 - type_4 ?v3 - type_1)
        :precondition (and (pred_1 ?v1 ?v2) 
		      	   (pred_1 ?v3 ?v2)
			   (pred_6 ?v1 ?v4)
			   (pred_5 ?v4)
			   (pred_4 ?v3))
        :effect (and (not (pred_4 ?v3))(not (pred_5 ?v4)) (pred_2 ?v3)))
)