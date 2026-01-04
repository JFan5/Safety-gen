(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_5 type_2 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v7 - type_4 ?v6 - type_1)
	(pred_6 ?v7 - type_5 ?v2 - type_3)
	(pred_4 ?v2 - type_3)
	(pred_2 ?v3 - type_1 ?v4 - type_1)
	(pred_1 ?v1 - type_2)
	(pred_3 ?v1 - type_2))                                                                                           
(:action op_1 
        :parameters (?v8 - type_1 ?v5 - type_1 ?v7 - type_5)
        :precondition (and (pred_5 ?v7 ?v8) 
                           (pred_2 ?v8 ?v5))                                                          
        :effect (and (not (pred_5 ?v7 ?v8)) (pred_5 ?v7 ?v5)))

(:action op_2 
        :parameters (?v6 - type_1 ?v2 - type_3 ?v7 - type_5)
        :precondition (and (pred_5 ?v7 ?v6) 
                           (pred_5 ?v2 ?v6))
        :effect (and (not (pred_5 ?v2 ?v6))
                     (pred_6 ?v7 ?v2)))

(:action op_3 
        :parameters (?v6 - type_1 ?v2 - type_3 ?v7 - type_5 ?v1 - type_2)
        :precondition (and (pred_5 ?v7 ?v6) 
		      	   (pred_5 ?v1 ?v6)
			   (pred_6 ?v7 ?v2)
			   (pred_4 ?v2)
			   (pred_3 ?v1))
        :effect (and (not (pred_3 ?v1))(not (pred_4 ?v2)) (pred_1 ?v1)))
)