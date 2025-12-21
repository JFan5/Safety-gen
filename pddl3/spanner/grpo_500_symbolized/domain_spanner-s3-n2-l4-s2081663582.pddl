(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_5 type_2 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v5 - type_4 ?v2 - type_1)
	(pred_5 ?v5 - type_5 ?v4 - type_3)
	(pred_4 ?v4 - type_3)
	(pred_1 ?v1 - type_1 ?v7 - type_1)
	(pred_6 ?v6 - type_2)
	(pred_2 ?v6 - type_2))                                                                                           
(:action op_2 
        :parameters (?v8 - type_1 ?v3 - type_1 ?v5 - type_5)
        :precondition (and (pred_3 ?v5 ?v8) 
                           (pred_1 ?v8 ?v3))                                                          
        :effect (and (not (pred_3 ?v5 ?v8)) (pred_3 ?v5 ?v3)))

(:action op_1 
        :parameters (?v2 - type_1 ?v4 - type_3 ?v5 - type_5)
        :precondition (and (pred_3 ?v5 ?v2) 
                           (pred_3 ?v4 ?v2))
        :effect (and (not (pred_3 ?v4 ?v2))
                     (pred_5 ?v5 ?v4)))

(:action op_3 
        :parameters (?v2 - type_1 ?v4 - type_3 ?v5 - type_5 ?v6 - type_2)
        :precondition (and (pred_3 ?v5 ?v2) 
		      	   (pred_3 ?v6 ?v2)
			   (pred_5 ?v5 ?v4)
			   (pred_4 ?v4)
			   (pred_2 ?v6))
        :effect (and (not (pred_2 ?v6))(not (pred_4 ?v4)) (pred_6 ?v6)))
)