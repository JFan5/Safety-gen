(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_2 type_1 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v5 - type_3 ?v6 - type_5)
	(pred_2 ?v5 - type_2 ?v7 - type_4)
	(pred_1 ?v7 - type_4)
	(pred_4 ?v8 - type_5 ?v2 - type_5)
	(pred_6 ?v1 - type_1)
	(pred_3 ?v1 - type_1))                                                                                           
(:action op_2 
        :parameters (?v3 - type_5 ?v4 - type_5 ?v5 - type_2)
        :precondition (and (pred_5 ?v5 ?v3) 
                           (pred_4 ?v3 ?v4))                                                          
        :effect (and (not (pred_5 ?v5 ?v3)) (pred_5 ?v5 ?v4)))

(:action op_1 
        :parameters (?v6 - type_5 ?v7 - type_4 ?v5 - type_2)
        :precondition (and (pred_5 ?v5 ?v6) 
                           (pred_5 ?v7 ?v6))
        :effect (and (not (pred_5 ?v7 ?v6))
                     (pred_2 ?v5 ?v7)))

(:action op_3 
        :parameters (?v6 - type_5 ?v7 - type_4 ?v5 - type_2 ?v1 - type_1)
        :precondition (and (pred_5 ?v5 ?v6) 
		      	   (pred_5 ?v1 ?v6)
			   (pred_2 ?v5 ?v7)
			   (pred_1 ?v7)
			   (pred_3 ?v1))
        :effect (and (not (pred_3 ?v1))(not (pred_1 ?v7)) (pred_6 ?v1)))
)