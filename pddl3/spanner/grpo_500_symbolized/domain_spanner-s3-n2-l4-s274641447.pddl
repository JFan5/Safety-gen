(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_5 type_2 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v3 - type_3 ?v5 - type_4)
	(pred_4 ?v3 - type_5 ?v1 - type_1)
	(pred_6 ?v1 - type_1)
	(pred_2 ?v7 - type_4 ?v2 - type_4)
	(pred_3 ?v8 - type_2)
	(pred_1 ?v8 - type_2))                                                                                           
(:action op_1 
        :parameters (?v6 - type_4 ?v4 - type_4 ?v3 - type_5)
        :precondition (and (pred_5 ?v3 ?v6) 
                           (pred_2 ?v6 ?v4))                                                          
        :effect (and (not (pred_5 ?v3 ?v6)) (pred_5 ?v3 ?v4)))

(:action op_2 
        :parameters (?v5 - type_4 ?v1 - type_1 ?v3 - type_5)
        :precondition (and (pred_5 ?v3 ?v5) 
                           (pred_5 ?v1 ?v5))
        :effect (and (not (pred_5 ?v1 ?v5))
                     (pred_4 ?v3 ?v1)))

(:action op_3 
        :parameters (?v5 - type_4 ?v1 - type_1 ?v3 - type_5 ?v8 - type_2)
        :precondition (and (pred_5 ?v3 ?v5) 
		      	   (pred_5 ?v8 ?v5)
			   (pred_4 ?v3 ?v1)
			   (pred_6 ?v1)
			   (pred_1 ?v8))
        :effect (and (not (pred_1 ?v8))(not (pred_6 ?v1)) (pred_3 ?v8)))
)