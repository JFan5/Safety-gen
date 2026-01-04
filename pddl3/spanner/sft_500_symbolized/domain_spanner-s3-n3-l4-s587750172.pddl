(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_5 type_4 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v8 - type_3 ?v1 - type_2)
	(pred_2 ?v8 - type_5 ?v5 - type_1)
	(pred_5 ?v5 - type_1)
	(pred_1 ?v3 - type_2 ?v6 - type_2)
	(pred_6 ?v4 - type_4)
	(pred_4 ?v4 - type_4))                                                                                           
(:action op_3 
        :parameters (?v7 - type_2 ?v2 - type_2 ?v8 - type_5)
        :precondition (and (pred_3 ?v8 ?v7) 
                           (pred_1 ?v7 ?v2))                                                          
        :effect (and (not (pred_3 ?v8 ?v7)) (pred_3 ?v8 ?v2)))

(:action op_2 
        :parameters (?v1 - type_2 ?v5 - type_1 ?v8 - type_5)
        :precondition (and (pred_3 ?v8 ?v1) 
                           (pred_3 ?v5 ?v1))
        :effect (and (not (pred_3 ?v5 ?v1))
                     (pred_2 ?v8 ?v5)))

(:action op_1 
        :parameters (?v1 - type_2 ?v5 - type_1 ?v8 - type_5 ?v4 - type_4)
        :precondition (and (pred_3 ?v8 ?v1) 
		      	   (pred_3 ?v4 ?v1)
			   (pred_2 ?v8 ?v5)
			   (pred_5 ?v5)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_5 ?v5)) (pred_6 ?v4)))
)