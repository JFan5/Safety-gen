(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_5 type_2 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v1 - type_4 ?v5 - type_1)
	(pred_3 ?v1 - type_5 ?v2 - type_3)
	(pred_1 ?v2 - type_3)
	(pred_2 ?v8 - type_1 ?v7 - type_1)
	(pred_4 ?v4 - type_2)
	(pred_5 ?v4 - type_2))                                                                                           
(:action op_3 
        :parameters (?v3 - type_1 ?v6 - type_1 ?v1 - type_5)
        :precondition (and (pred_6 ?v1 ?v3) 
                           (pred_2 ?v3 ?v6))                                                          
        :effect (and (not (pred_6 ?v1 ?v3)) (pred_6 ?v1 ?v6)))

(:action op_1 
        :parameters (?v5 - type_1 ?v2 - type_3 ?v1 - type_5)
        :precondition (and (pred_6 ?v1 ?v5) 
                           (pred_6 ?v2 ?v5))
        :effect (and (not (pred_6 ?v2 ?v5))
                     (pred_3 ?v1 ?v2)))

(:action op_2 
        :parameters (?v5 - type_1 ?v2 - type_3 ?v1 - type_5 ?v4 - type_2)
        :precondition (and (pred_6 ?v1 ?v5) 
		      	   (pred_6 ?v4 ?v5)
			   (pred_3 ?v1 ?v2)
			   (pred_1 ?v2)
			   (pred_5 ?v4))
        :effect (and (not (pred_5 ?v4))(not (pred_1 ?v2)) (pred_4 ?v4)))
)