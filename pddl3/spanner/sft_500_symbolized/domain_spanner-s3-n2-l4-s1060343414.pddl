(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_4 type_5 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v3 - type_1 ?v4 - type_3)
	(pred_4 ?v3 - type_4 ?v7 - type_2)
	(pred_6 ?v7 - type_2)
	(pred_1 ?v8 - type_3 ?v6 - type_3)
	(pred_5 ?v1 - type_5)
	(pred_2 ?v1 - type_5))                                                                                           
(:action op_3 
        :parameters (?v2 - type_3 ?v5 - type_3 ?v3 - type_4)
        :precondition (and (pred_3 ?v3 ?v2) 
                           (pred_1 ?v2 ?v5))                                                          
        :effect (and (not (pred_3 ?v3 ?v2)) (pred_3 ?v3 ?v5)))

(:action op_1 
        :parameters (?v4 - type_3 ?v7 - type_2 ?v3 - type_4)
        :precondition (and (pred_3 ?v3 ?v4) 
                           (pred_3 ?v7 ?v4))
        :effect (and (not (pred_3 ?v7 ?v4))
                     (pred_4 ?v3 ?v7)))

(:action op_2 
        :parameters (?v4 - type_3 ?v7 - type_2 ?v3 - type_4 ?v1 - type_5)
        :precondition (and (pred_3 ?v3 ?v4) 
		      	   (pred_3 ?v1 ?v4)
			   (pred_4 ?v3 ?v7)
			   (pred_6 ?v7)
			   (pred_2 ?v1))
        :effect (and (not (pred_2 ?v1))(not (pred_6 ?v7)) (pred_5 ?v1)))
)