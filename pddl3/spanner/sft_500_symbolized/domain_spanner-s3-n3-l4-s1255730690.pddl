(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_4 type_5 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v2 - type_1 ?v3 - type_2)
	(pred_4 ?v2 - type_4 ?v4 - type_3)
	(pred_5 ?v4 - type_3)
	(pred_6 ?v8 - type_2 ?v6 - type_2)
	(pred_2 ?v7 - type_5)
	(pred_3 ?v7 - type_5))                                                                                           
(:action op_2 
        :parameters (?v5 - type_2 ?v1 - type_2 ?v2 - type_4)
        :precondition (and (pred_1 ?v2 ?v5) 
                           (pred_6 ?v5 ?v1))                                                          
        :effect (and (not (pred_1 ?v2 ?v5)) (pred_1 ?v2 ?v1)))

(:action op_3 
        :parameters (?v3 - type_2 ?v4 - type_3 ?v2 - type_4)
        :precondition (and (pred_1 ?v2 ?v3) 
                           (pred_1 ?v4 ?v3))
        :effect (and (not (pred_1 ?v4 ?v3))
                     (pred_4 ?v2 ?v4)))

(:action op_1 
        :parameters (?v3 - type_2 ?v4 - type_3 ?v2 - type_4 ?v7 - type_5)
        :precondition (and (pred_1 ?v2 ?v3) 
		      	   (pred_1 ?v7 ?v3)
			   (pred_4 ?v2 ?v4)
			   (pred_5 ?v4)
			   (pred_3 ?v7))
        :effect (and (not (pred_3 ?v7))(not (pred_5 ?v4)) (pred_2 ?v7)))
)