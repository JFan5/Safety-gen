(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_3 type_2 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_4 ?v3 - type_1)
	(pred_6 ?v5 - type_3 ?v2 - type_5)
	(pred_5 ?v2 - type_5)
	(pred_3 ?v8 - type_1 ?v1 - type_1)
	(pred_1 ?v4 - type_2)
	(pred_2 ?v4 - type_2))                                                                                           
(:action op_2 
        :parameters (?v6 - type_1 ?v7 - type_1 ?v5 - type_3)
        :precondition (and (pred_4 ?v5 ?v6) 
                           (pred_3 ?v6 ?v7))                                                          
        :effect (and (not (pred_4 ?v5 ?v6)) (pred_4 ?v5 ?v7)))

(:action op_3 
        :parameters (?v3 - type_1 ?v2 - type_5 ?v5 - type_3)
        :precondition (and (pred_4 ?v5 ?v3) 
                           (pred_4 ?v2 ?v3))
        :effect (and (not (pred_4 ?v2 ?v3))
                     (pred_6 ?v5 ?v2)))

(:action op_1 
        :parameters (?v3 - type_1 ?v2 - type_5 ?v5 - type_3 ?v4 - type_2)
        :precondition (and (pred_4 ?v5 ?v3) 
		      	   (pred_4 ?v4 ?v3)
			   (pred_6 ?v5 ?v2)
			   (pred_5 ?v2)
			   (pred_2 ?v4))
        :effect (and (not (pred_2 ?v4))(not (pred_5 ?v2)) (pred_1 ?v4)))
)