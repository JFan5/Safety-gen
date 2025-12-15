(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_3 type_4 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v5 - type_2 ?v2 - type_1)
	(pred_2 ?v5 - type_3 ?v3 - type_5)
	(pred_4 ?v3 - type_5)
	(pred_3 ?v6 - type_1 ?v8 - type_1)
	(pred_5 ?v7 - type_4)
	(pred_6 ?v7 - type_4))                                                                                           
(:action op_1 
        :parameters (?v4 - type_1 ?v1 - type_1 ?v5 - type_3)
        :precondition (and (pred_1 ?v5 ?v4) 
                           (pred_3 ?v4 ?v1))                                                          
        :effect (and (not (pred_1 ?v5 ?v4)) (pred_1 ?v5 ?v1)))

(:action op_3 
        :parameters (?v2 - type_1 ?v3 - type_5 ?v5 - type_3)
        :precondition (and (pred_1 ?v5 ?v2) 
                           (pred_1 ?v3 ?v2))
        :effect (and (not (pred_1 ?v3 ?v2))
                     (pred_2 ?v5 ?v3)))

(:action op_2 
        :parameters (?v2 - type_1 ?v3 - type_5 ?v5 - type_3 ?v7 - type_4)
        :precondition (and (pred_1 ?v5 ?v2) 
		      	   (pred_1 ?v7 ?v2)
			   (pred_2 ?v5 ?v3)
			   (pred_4 ?v3)
			   (pred_6 ?v7))
        :effect (and (not (pred_6 ?v7))(not (pred_4 ?v3)) (pred_5 ?v7)))
)