(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_5 type_1 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v4 - type_4 ?v8 - type_3)
	(pred_4 ?v4 - type_5 ?v1 - type_2)
	(pred_6 ?v1 - type_2)
	(pred_2 ?v6 - type_3 ?v7 - type_3)
	(pred_3 ?v5 - type_1)
	(pred_5 ?v5 - type_1))                                                                                           
(:action op_2 
        :parameters (?v3 - type_3 ?v2 - type_3 ?v4 - type_5)
        :precondition (and (pred_1 ?v4 ?v3) 
                           (pred_2 ?v3 ?v2))                                                          
        :effect (and (not (pred_1 ?v4 ?v3)) (pred_1 ?v4 ?v2)))

(:action op_1 
        :parameters (?v8 - type_3 ?v1 - type_2 ?v4 - type_5)
        :precondition (and (pred_1 ?v4 ?v8) 
                           (pred_1 ?v1 ?v8))
        :effect (and (not (pred_1 ?v1 ?v8))
                     (pred_4 ?v4 ?v1)))

(:action op_3 
        :parameters (?v8 - type_3 ?v1 - type_2 ?v4 - type_5 ?v5 - type_1)
        :precondition (and (pred_1 ?v4 ?v8) 
		      	   (pred_1 ?v5 ?v8)
			   (pred_4 ?v4 ?v1)
			   (pred_6 ?v1)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_6 ?v1)) (pred_3 ?v5)))
)