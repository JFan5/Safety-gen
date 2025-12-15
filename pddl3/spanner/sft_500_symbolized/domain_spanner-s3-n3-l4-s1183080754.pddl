(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_5 type_3 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v3 - type_2 ?v1 - type_1)
	(pred_2 ?v3 - type_5 ?v4 - type_4)
	(pred_5 ?v4 - type_4)
	(pred_4 ?v7 - type_1 ?v8 - type_1)
	(pred_3 ?v5 - type_3)
	(pred_6 ?v5 - type_3))                                                                                           
(:action op_2 
        :parameters (?v6 - type_1 ?v2 - type_1 ?v3 - type_5)
        :precondition (and (pred_1 ?v3 ?v6) 
                           (pred_4 ?v6 ?v2))                                                          
        :effect (and (not (pred_1 ?v3 ?v6)) (pred_1 ?v3 ?v2)))

(:action op_1 
        :parameters (?v1 - type_1 ?v4 - type_4 ?v3 - type_5)
        :precondition (and (pred_1 ?v3 ?v1) 
                           (pred_1 ?v4 ?v1))
        :effect (and (not (pred_1 ?v4 ?v1))
                     (pred_2 ?v3 ?v4)))

(:action op_3 
        :parameters (?v1 - type_1 ?v4 - type_4 ?v3 - type_5 ?v5 - type_3)
        :precondition (and (pred_1 ?v3 ?v1) 
		      	   (pred_1 ?v5 ?v1)
			   (pred_2 ?v3 ?v4)
			   (pred_5 ?v4)
			   (pred_6 ?v5))
        :effect (and (not (pred_6 ?v5))(not (pred_5 ?v4)) (pred_3 ?v5)))
)