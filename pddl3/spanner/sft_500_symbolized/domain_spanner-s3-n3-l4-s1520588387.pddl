(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_5 type_4 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_1 ?v6 - type_2)
	(pred_6 ?v1 - type_5 ?v4 - type_3)
	(pred_5 ?v4 - type_3)
	(pred_2 ?v5 - type_2 ?v8 - type_2)
	(pred_1 ?v3 - type_4)
	(pred_4 ?v3 - type_4))                                                                                           
(:action op_1 
        :parameters (?v7 - type_2 ?v2 - type_2 ?v1 - type_5)
        :precondition (and (pred_3 ?v1 ?v7) 
                           (pred_2 ?v7 ?v2))                                                          
        :effect (and (not (pred_3 ?v1 ?v7)) (pred_3 ?v1 ?v2)))

(:action op_3 
        :parameters (?v6 - type_2 ?v4 - type_3 ?v1 - type_5)
        :precondition (and (pred_3 ?v1 ?v6) 
                           (pred_3 ?v4 ?v6))
        :effect (and (not (pred_3 ?v4 ?v6))
                     (pred_6 ?v1 ?v4)))

(:action op_2 
        :parameters (?v6 - type_2 ?v4 - type_3 ?v1 - type_5 ?v3 - type_4)
        :precondition (and (pred_3 ?v1 ?v6) 
		      	   (pred_3 ?v3 ?v6)
			   (pred_6 ?v1 ?v4)
			   (pred_5 ?v4)
			   (pred_4 ?v3))
        :effect (and (not (pred_4 ?v3))(not (pred_5 ?v4)) (pred_1 ?v3)))
)