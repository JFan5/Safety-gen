(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_1 type_4 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v2 - type_3 ?v7 - type_5)
	(pred_5 ?v2 - type_1 ?v4 - type_2)
	(pred_2 ?v4 - type_2)
	(pred_3 ?v1 - type_5 ?v8 - type_5)
	(pred_6 ?v3 - type_4)
	(pred_4 ?v3 - type_4))                                                                                           
(:action op_3 
        :parameters (?v6 - type_5 ?v5 - type_5 ?v2 - type_1)
        :precondition (and (pred_1 ?v2 ?v6) 
                           (pred_3 ?v6 ?v5))                                                          
        :effect (and (not (pred_1 ?v2 ?v6)) (pred_1 ?v2 ?v5)))

(:action op_2 
        :parameters (?v7 - type_5 ?v4 - type_2 ?v2 - type_1)
        :precondition (and (pred_1 ?v2 ?v7) 
                           (pred_1 ?v4 ?v7))
        :effect (and (not (pred_1 ?v4 ?v7))
                     (pred_5 ?v2 ?v4)))

(:action op_1 
        :parameters (?v7 - type_5 ?v4 - type_2 ?v2 - type_1 ?v3 - type_4)
        :precondition (and (pred_1 ?v2 ?v7) 
		      	   (pred_1 ?v3 ?v7)
			   (pred_5 ?v2 ?v4)
			   (pred_2 ?v4)
			   (pred_4 ?v3))
        :effect (and (not (pred_4 ?v3))(not (pred_2 ?v4)) (pred_6 ?v3)))
)