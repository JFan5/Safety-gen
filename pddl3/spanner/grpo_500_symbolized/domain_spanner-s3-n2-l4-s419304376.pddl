(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_2 type_3 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_5 ?v2 - type_4)
	(pred_1 ?v6 - type_2 ?v1 - type_1)
	(pred_6 ?v1 - type_1)
	(pred_3 ?v8 - type_4 ?v3 - type_4)
	(pred_2 ?v5 - type_3)
	(pred_4 ?v5 - type_3))                                                                                           
(:action op_3 
        :parameters (?v7 - type_4 ?v4 - type_4 ?v6 - type_2)
        :precondition (and (pred_5 ?v6 ?v7) 
                           (pred_3 ?v7 ?v4))                                                          
        :effect (and (not (pred_5 ?v6 ?v7)) (pred_5 ?v6 ?v4)))

(:action op_1 
        :parameters (?v2 - type_4 ?v1 - type_1 ?v6 - type_2)
        :precondition (and (pred_5 ?v6 ?v2) 
                           (pred_5 ?v1 ?v2))
        :effect (and (not (pred_5 ?v1 ?v2))
                     (pred_1 ?v6 ?v1)))

(:action op_2 
        :parameters (?v2 - type_4 ?v1 - type_1 ?v6 - type_2 ?v5 - type_3)
        :precondition (and (pred_5 ?v6 ?v2) 
		      	   (pred_5 ?v5 ?v2)
			   (pred_1 ?v6 ?v1)
			   (pred_6 ?v1)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_6 ?v1)) (pred_2 ?v5)))
)