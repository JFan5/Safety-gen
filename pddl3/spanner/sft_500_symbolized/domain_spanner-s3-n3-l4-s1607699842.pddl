(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_4 type_2 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_5 ?v5 - type_1)
	(pred_1 ?v6 - type_4 ?v2 - type_3)
	(pred_4 ?v2 - type_3)
	(pred_6 ?v3 - type_1 ?v8 - type_1)
	(pred_2 ?v4 - type_2)
	(pred_3 ?v4 - type_2))                                                                                           
(:action op_2 
        :parameters (?v1 - type_1 ?v7 - type_1 ?v6 - type_4)
        :precondition (and (pred_5 ?v6 ?v1) 
                           (pred_6 ?v1 ?v7))                                                          
        :effect (and (not (pred_5 ?v6 ?v1)) (pred_5 ?v6 ?v7)))

(:action op_1 
        :parameters (?v5 - type_1 ?v2 - type_3 ?v6 - type_4)
        :precondition (and (pred_5 ?v6 ?v5) 
                           (pred_5 ?v2 ?v5))
        :effect (and (not (pred_5 ?v2 ?v5))
                     (pred_1 ?v6 ?v2)))

(:action op_3 
        :parameters (?v5 - type_1 ?v2 - type_3 ?v6 - type_4 ?v4 - type_2)
        :precondition (and (pred_5 ?v6 ?v5) 
		      	   (pred_5 ?v4 ?v5)
			   (pred_1 ?v6 ?v2)
			   (pred_4 ?v2)
			   (pred_3 ?v4))
        :effect (and (not (pred_3 ?v4))(not (pred_4 ?v2)) (pred_2 ?v4)))
)