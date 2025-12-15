(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_1 type_2 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v2 - type_4 ?v6 - type_5)
	(pred_3 ?v2 - type_1 ?v1 - type_3)
	(pred_1 ?v1 - type_3)
	(pred_5 ?v3 - type_5 ?v4 - type_5)
	(pred_6 ?v5 - type_2)
	(pred_4 ?v5 - type_2))                                                                                           
(:action op_3 
        :parameters (?v7 - type_5 ?v8 - type_5 ?v2 - type_1)
        :precondition (and (pred_2 ?v2 ?v7) 
                           (pred_5 ?v7 ?v8))                                                          
        :effect (and (not (pred_2 ?v2 ?v7)) (pred_2 ?v2 ?v8)))

(:action op_1 
        :parameters (?v6 - type_5 ?v1 - type_3 ?v2 - type_1)
        :precondition (and (pred_2 ?v2 ?v6) 
                           (pred_2 ?v1 ?v6))
        :effect (and (not (pred_2 ?v1 ?v6))
                     (pred_3 ?v2 ?v1)))

(:action op_2 
        :parameters (?v6 - type_5 ?v1 - type_3 ?v2 - type_1 ?v5 - type_2)
        :precondition (and (pred_2 ?v2 ?v6) 
		      	   (pred_2 ?v5 ?v6)
			   (pred_3 ?v2 ?v1)
			   (pred_1 ?v1)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_1 ?v1)) (pred_6 ?v5)))
)