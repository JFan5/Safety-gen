(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_2 type_3 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v6 - type_4 ?v5 - type_1)
	(pred_4 ?v6 - type_2 ?v7 - type_5)
	(pred_5 ?v7 - type_5)
	(pred_6 ?v4 - type_1 ?v8 - type_1)
	(pred_3 ?v3 - type_3)
	(pred_1 ?v3 - type_3))                                                                                           
(:action op_3 
        :parameters (?v2 - type_1 ?v1 - type_1 ?v6 - type_2)
        :precondition (and (pred_2 ?v6 ?v2) 
                           (pred_6 ?v2 ?v1))                                                          
        :effect (and (not (pred_2 ?v6 ?v2)) (pred_2 ?v6 ?v1)))

(:action op_2 
        :parameters (?v5 - type_1 ?v7 - type_5 ?v6 - type_2)
        :precondition (and (pred_2 ?v6 ?v5) 
                           (pred_2 ?v7 ?v5))
        :effect (and (not (pred_2 ?v7 ?v5))
                     (pred_4 ?v6 ?v7)))

(:action op_1 
        :parameters (?v5 - type_1 ?v7 - type_5 ?v6 - type_2 ?v3 - type_3)
        :precondition (and (pred_2 ?v6 ?v5) 
		      	   (pred_2 ?v3 ?v5)
			   (pred_4 ?v6 ?v7)
			   (pred_5 ?v7)
			   (pred_1 ?v3))
        :effect (and (not (pred_1 ?v3))(not (pred_5 ?v7)) (pred_3 ?v3)))
)