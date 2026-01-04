(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_4 type_1 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v1 - type_3 ?v6 - type_2)
	(pred_3 ?v1 - type_4 ?v4 - type_5)
	(pred_5 ?v4 - type_5)
	(pred_2 ?v8 - type_2 ?v7 - type_2)
	(pred_1 ?v5 - type_1)
	(pred_6 ?v5 - type_1))                                                                                           
(:action op_3 
        :parameters (?v2 - type_2 ?v3 - type_2 ?v1 - type_4)
        :precondition (and (pred_4 ?v1 ?v2) 
                           (pred_2 ?v2 ?v3))                                                          
        :effect (and (not (pred_4 ?v1 ?v2)) (pred_4 ?v1 ?v3)))

(:action op_2 
        :parameters (?v6 - type_2 ?v4 - type_5 ?v1 - type_4)
        :precondition (and (pred_4 ?v1 ?v6) 
                           (pred_4 ?v4 ?v6))
        :effect (and (not (pred_4 ?v4 ?v6))
                     (pred_3 ?v1 ?v4)))

(:action op_1 
        :parameters (?v6 - type_2 ?v4 - type_5 ?v1 - type_4 ?v5 - type_1)
        :precondition (and (pred_4 ?v1 ?v6) 
		      	   (pred_4 ?v5 ?v6)
			   (pred_3 ?v1 ?v4)
			   (pred_5 ?v4)
			   (pred_6 ?v5))
        :effect (and (not (pred_6 ?v5))(not (pred_5 ?v4)) (pred_1 ?v5)))
)