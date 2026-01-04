(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_4 type_5 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v2 - type_2 ?v1 - type_1)
	(pred_1 ?v2 - type_4 ?v3 - type_3)
	(pred_5 ?v3 - type_3)
	(pred_4 ?v8 - type_1 ?v5 - type_1)
	(pred_2 ?v4 - type_5)
	(pred_3 ?v4 - type_5))                                                                                           
(:action op_2 
        :parameters (?v6 - type_1 ?v7 - type_1 ?v2 - type_4)
        :precondition (and (pred_6 ?v2 ?v6) 
                           (pred_4 ?v6 ?v7))                                                          
        :effect (and (not (pred_6 ?v2 ?v6)) (pred_6 ?v2 ?v7)))

(:action op_3 
        :parameters (?v1 - type_1 ?v3 - type_3 ?v2 - type_4)
        :precondition (and (pred_6 ?v2 ?v1) 
                           (pred_6 ?v3 ?v1))
        :effect (and (not (pred_6 ?v3 ?v1))
                     (pred_1 ?v2 ?v3)))

(:action op_1 
        :parameters (?v1 - type_1 ?v3 - type_3 ?v2 - type_4 ?v4 - type_5)
        :precondition (and (pred_6 ?v2 ?v1) 
		      	   (pred_6 ?v4 ?v1)
			   (pred_1 ?v2 ?v3)
			   (pred_5 ?v3)
			   (pred_3 ?v4))
        :effect (and (not (pred_3 ?v4))(not (pred_5 ?v3)) (pred_2 ?v4)))
)