(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_4 type_2 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v6 - type_5 ?v5 - type_1)
	(pred_3 ?v6 - type_4 ?v4 - type_3)
	(pred_6 ?v4 - type_3)
	(pred_5 ?v8 - type_1 ?v3 - type_1)
	(pred_2 ?v2 - type_2)
	(pred_4 ?v2 - type_2))                                                                                           
(:action op_1 
        :parameters (?v7 - type_1 ?v1 - type_1 ?v6 - type_4)
        :precondition (and (pred_1 ?v6 ?v7) 
                           (pred_5 ?v7 ?v1))                                                          
        :effect (and (not (pred_1 ?v6 ?v7)) (pred_1 ?v6 ?v1)))

(:action op_2 
        :parameters (?v5 - type_1 ?v4 - type_3 ?v6 - type_4)
        :precondition (and (pred_1 ?v6 ?v5) 
                           (pred_1 ?v4 ?v5))
        :effect (and (not (pred_1 ?v4 ?v5))
                     (pred_3 ?v6 ?v4)))

(:action op_3 
        :parameters (?v5 - type_1 ?v4 - type_3 ?v6 - type_4 ?v2 - type_2)
        :precondition (and (pred_1 ?v6 ?v5) 
		      	   (pred_1 ?v2 ?v5)
			   (pred_3 ?v6 ?v4)
			   (pred_6 ?v4)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_6 ?v4)) (pred_2 ?v2)))
)