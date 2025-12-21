(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_5 type_2 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v3 - type_3 ?v8 - type_4)
	(pred_4 ?v3 - type_5 ?v1 - type_1)
	(pred_5 ?v1 - type_1)
	(pred_3 ?v2 - type_4 ?v7 - type_4)
	(pred_2 ?v4 - type_2)
	(pred_6 ?v4 - type_2))                                                                                           
(:action op_3 
        :parameters (?v6 - type_4 ?v5 - type_4 ?v3 - type_5)
        :precondition (and (pred_1 ?v3 ?v6) 
                           (pred_3 ?v6 ?v5))                                                          
        :effect (and (not (pred_1 ?v3 ?v6)) (pred_1 ?v3 ?v5)))

(:action op_1 
        :parameters (?v8 - type_4 ?v1 - type_1 ?v3 - type_5)
        :precondition (and (pred_1 ?v3 ?v8) 
                           (pred_1 ?v1 ?v8))
        :effect (and (not (pred_1 ?v1 ?v8))
                     (pred_4 ?v3 ?v1)))

(:action op_2 
        :parameters (?v8 - type_4 ?v1 - type_1 ?v3 - type_5 ?v4 - type_2)
        :precondition (and (pred_1 ?v3 ?v8) 
		      	   (pred_1 ?v4 ?v8)
			   (pred_4 ?v3 ?v1)
			   (pred_5 ?v1)
			   (pred_6 ?v4))
        :effect (and (not (pred_6 ?v4))(not (pred_5 ?v1)) (pred_2 ?v4)))
)