(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_2 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v2 - type_3 ?v6 - type_1)
	(pred_6 ?v2 - type_2 ?v4 - type_4)
	(pred_1 ?v4 - type_4)
	(pred_5 ?v8 - type_1 ?v1 - type_1)
	(pred_2 ?v5 - type_5)
	(pred_4 ?v5 - type_5))                                                                                           
(:action op_1 
        :parameters (?v7 - type_1 ?v3 - type_1 ?v2 - type_2)
        :precondition (and (pred_3 ?v2 ?v7) 
                           (pred_5 ?v7 ?v3))                                                          
        :effect (and (not (pred_3 ?v2 ?v7)) (pred_3 ?v2 ?v3)))

(:action op_3 
        :parameters (?v6 - type_1 ?v4 - type_4 ?v2 - type_2)
        :precondition (and (pred_3 ?v2 ?v6) 
                           (pred_3 ?v4 ?v6))
        :effect (and (not (pred_3 ?v4 ?v6))
                     (pred_6 ?v2 ?v4)))

(:action op_2 
        :parameters (?v6 - type_1 ?v4 - type_4 ?v2 - type_2 ?v5 - type_5)
        :precondition (and (pred_3 ?v2 ?v6) 
		      	   (pred_3 ?v5 ?v6)
			   (pred_6 ?v2 ?v4)
			   (pred_1 ?v4)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_1 ?v4)) (pred_2 ?v5)))
)