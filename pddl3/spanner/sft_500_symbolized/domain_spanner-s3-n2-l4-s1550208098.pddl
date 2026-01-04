(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_5 type_2 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_4 ?v6 - type_1)
	(pred_6 ?v4 - type_5 ?v1 - type_3)
	(pred_5 ?v1 - type_3)
	(pred_4 ?v7 - type_1 ?v3 - type_1)
	(pred_3 ?v8 - type_2)
	(pred_1 ?v8 - type_2))                                                                                           
(:action op_3 
        :parameters (?v5 - type_1 ?v2 - type_1 ?v4 - type_5)
        :precondition (and (pred_2 ?v4 ?v5) 
                           (pred_4 ?v5 ?v2))                                                          
        :effect (and (not (pred_2 ?v4 ?v5)) (pred_2 ?v4 ?v2)))

(:action op_2 
        :parameters (?v6 - type_1 ?v1 - type_3 ?v4 - type_5)
        :precondition (and (pred_2 ?v4 ?v6) 
                           (pred_2 ?v1 ?v6))
        :effect (and (not (pred_2 ?v1 ?v6))
                     (pred_6 ?v4 ?v1)))

(:action op_1 
        :parameters (?v6 - type_1 ?v1 - type_3 ?v4 - type_5 ?v8 - type_2)
        :precondition (and (pred_2 ?v4 ?v6) 
		      	   (pred_2 ?v8 ?v6)
			   (pred_6 ?v4 ?v1)
			   (pred_5 ?v1)
			   (pred_1 ?v8))
        :effect (and (not (pred_1 ?v8))(not (pred_5 ?v1)) (pred_3 ?v8)))
)