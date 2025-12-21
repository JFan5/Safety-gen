(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_1 type_3 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v5 - type_2 ?v1 - type_5)
	(pred_2 ?v5 - type_1 ?v4 - type_4)
	(pred_3 ?v4 - type_4)
	(pred_5 ?v2 - type_5 ?v8 - type_5)
	(pred_4 ?v3 - type_3)
	(pred_1 ?v3 - type_3))                                                                                           
(:action op_2 
        :parameters (?v6 - type_5 ?v7 - type_5 ?v5 - type_1)
        :precondition (and (pred_6 ?v5 ?v6) 
                           (pred_5 ?v6 ?v7))                                                          
        :effect (and (not (pred_6 ?v5 ?v6)) (pred_6 ?v5 ?v7)))

(:action op_1 
        :parameters (?v1 - type_5 ?v4 - type_4 ?v5 - type_1)
        :precondition (and (pred_6 ?v5 ?v1) 
                           (pred_6 ?v4 ?v1))
        :effect (and (not (pred_6 ?v4 ?v1))
                     (pred_2 ?v5 ?v4)))

(:action op_3 
        :parameters (?v1 - type_5 ?v4 - type_4 ?v5 - type_1 ?v3 - type_3)
        :precondition (and (pred_6 ?v5 ?v1) 
		      	   (pred_6 ?v3 ?v1)
			   (pred_2 ?v5 ?v4)
			   (pred_3 ?v4)
			   (pred_1 ?v3))
        :effect (and (not (pred_1 ?v3))(not (pred_3 ?v4)) (pred_4 ?v3)))
)