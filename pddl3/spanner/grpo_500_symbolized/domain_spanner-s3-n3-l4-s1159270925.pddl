(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_2 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v3 - type_3 ?v1 - type_1)
	(pred_6 ?v3 - type_2 ?v4 - type_4)
	(pred_2 ?v4 - type_4)
	(pred_5 ?v2 - type_1 ?v7 - type_1)
	(pred_4 ?v5 - type_5)
	(pred_1 ?v5 - type_5))                                                                                           
(:action op_2 
        :parameters (?v8 - type_1 ?v6 - type_1 ?v3 - type_2)
        :precondition (and (pred_3 ?v3 ?v8) 
                           (pred_5 ?v8 ?v6))                                                          
        :effect (and (not (pred_3 ?v3 ?v8)) (pred_3 ?v3 ?v6)))

(:action op_3 
        :parameters (?v1 - type_1 ?v4 - type_4 ?v3 - type_2)
        :precondition (and (pred_3 ?v3 ?v1) 
                           (pred_3 ?v4 ?v1))
        :effect (and (not (pred_3 ?v4 ?v1))
                     (pred_6 ?v3 ?v4)))

(:action op_1 
        :parameters (?v1 - type_1 ?v4 - type_4 ?v3 - type_2 ?v5 - type_5)
        :precondition (and (pred_3 ?v3 ?v1) 
		      	   (pred_3 ?v5 ?v1)
			   (pred_6 ?v3 ?v4)
			   (pred_2 ?v4)
			   (pred_1 ?v5))
        :effect (and (not (pred_1 ?v5))(not (pred_2 ?v4)) (pred_4 ?v5)))
)