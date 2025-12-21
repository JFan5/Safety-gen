(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_1 type_5 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v6 - type_4 ?v5 - type_3)
	(pred_6 ?v6 - type_1 ?v2 - type_2)
	(pred_4 ?v2 - type_2)
	(pred_5 ?v3 - type_3 ?v8 - type_3)
	(pred_3 ?v7 - type_5)
	(pred_2 ?v7 - type_5))                                                                                           
(:action op_2 
        :parameters (?v1 - type_3 ?v4 - type_3 ?v6 - type_1)
        :precondition (and (pred_1 ?v6 ?v1) 
                           (pred_5 ?v1 ?v4))                                                          
        :effect (and (not (pred_1 ?v6 ?v1)) (pred_1 ?v6 ?v4)))

(:action op_1 
        :parameters (?v5 - type_3 ?v2 - type_2 ?v6 - type_1)
        :precondition (and (pred_1 ?v6 ?v5) 
                           (pred_1 ?v2 ?v5))
        :effect (and (not (pred_1 ?v2 ?v5))
                     (pred_6 ?v6 ?v2)))

(:action op_3 
        :parameters (?v5 - type_3 ?v2 - type_2 ?v6 - type_1 ?v7 - type_5)
        :precondition (and (pred_1 ?v6 ?v5) 
		      	   (pred_1 ?v7 ?v5)
			   (pred_6 ?v6 ?v2)
			   (pred_4 ?v2)
			   (pred_2 ?v7))
        :effect (and (not (pred_2 ?v7))(not (pred_4 ?v2)) (pred_3 ?v7)))
)