(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_3 type_1 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_2 ?v3 - type_5)
	(pred_2 ?v5 - type_3 ?v7 - type_4)
	(pred_3 ?v7 - type_4)
	(pred_6 ?v8 - type_5 ?v6 - type_5)
	(pred_1 ?v4 - type_1)
	(pred_5 ?v4 - type_1))                                                                                           
(:action op_1 
        :parameters (?v2 - type_5 ?v1 - type_5 ?v5 - type_3)
        :precondition (and (pred_4 ?v5 ?v2) 
                           (pred_6 ?v2 ?v1))                                                          
        :effect (and (not (pred_4 ?v5 ?v2)) (pred_4 ?v5 ?v1)))

(:action op_3 
        :parameters (?v3 - type_5 ?v7 - type_4 ?v5 - type_3)
        :precondition (and (pred_4 ?v5 ?v3) 
                           (pred_4 ?v7 ?v3))
        :effect (and (not (pred_4 ?v7 ?v3))
                     (pred_2 ?v5 ?v7)))

(:action op_2 
        :parameters (?v3 - type_5 ?v7 - type_4 ?v5 - type_3 ?v4 - type_1)
        :precondition (and (pred_4 ?v5 ?v3) 
		      	   (pred_4 ?v4 ?v3)
			   (pred_2 ?v5 ?v7)
			   (pred_3 ?v7)
			   (pred_5 ?v4))
        :effect (and (not (pred_5 ?v4))(not (pred_3 ?v7)) (pred_1 ?v4)))
)