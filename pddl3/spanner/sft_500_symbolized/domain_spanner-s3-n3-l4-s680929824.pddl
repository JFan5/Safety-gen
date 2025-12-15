(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_1 type_4 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v3 - type_3 ?v1 - type_5)
	(pred_5 ?v3 - type_1 ?v7 - type_2)
	(pred_2 ?v7 - type_2)
	(pred_4 ?v8 - type_5 ?v2 - type_5)
	(pred_3 ?v6 - type_4)
	(pred_6 ?v6 - type_4))                                                                                           
(:action op_1 
        :parameters (?v4 - type_5 ?v5 - type_5 ?v3 - type_1)
        :precondition (and (pred_1 ?v3 ?v4) 
                           (pred_4 ?v4 ?v5))                                                          
        :effect (and (not (pred_1 ?v3 ?v4)) (pred_1 ?v3 ?v5)))

(:action op_3 
        :parameters (?v1 - type_5 ?v7 - type_2 ?v3 - type_1)
        :precondition (and (pred_1 ?v3 ?v1) 
                           (pred_1 ?v7 ?v1))
        :effect (and (not (pred_1 ?v7 ?v1))
                     (pred_5 ?v3 ?v7)))

(:action op_2 
        :parameters (?v1 - type_5 ?v7 - type_2 ?v3 - type_1 ?v6 - type_4)
        :precondition (and (pred_1 ?v3 ?v1) 
		      	   (pred_1 ?v6 ?v1)
			   (pred_5 ?v3 ?v7)
			   (pred_2 ?v7)
			   (pred_6 ?v6))
        :effect (and (not (pred_6 ?v6))(not (pred_2 ?v7)) (pred_3 ?v6)))
)