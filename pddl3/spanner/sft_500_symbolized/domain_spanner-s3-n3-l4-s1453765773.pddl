(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_2 type_3 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_1 ?v6 - type_4)
	(pred_3 ?v3 - type_2 ?v4 - type_5)
	(pred_1 ?v4 - type_5)
	(pred_4 ?v1 - type_4 ?v5 - type_4)
	(pred_6 ?v7 - type_3)
	(pred_5 ?v7 - type_3))                                                                                           
(:action op_2 
        :parameters (?v8 - type_4 ?v2 - type_4 ?v3 - type_2)
        :precondition (and (pred_2 ?v3 ?v8) 
                           (pred_4 ?v8 ?v2))                                                          
        :effect (and (not (pred_2 ?v3 ?v8)) (pred_2 ?v3 ?v2)))

(:action op_3 
        :parameters (?v6 - type_4 ?v4 - type_5 ?v3 - type_2)
        :precondition (and (pred_2 ?v3 ?v6) 
                           (pred_2 ?v4 ?v6))
        :effect (and (not (pred_2 ?v4 ?v6))
                     (pred_3 ?v3 ?v4)))

(:action op_1 
        :parameters (?v6 - type_4 ?v4 - type_5 ?v3 - type_2 ?v7 - type_3)
        :precondition (and (pred_2 ?v3 ?v6) 
		      	   (pred_2 ?v7 ?v6)
			   (pred_3 ?v3 ?v4)
			   (pred_1 ?v4)
			   (pred_5 ?v7))
        :effect (and (not (pred_5 ?v7))(not (pred_1 ?v4)) (pred_6 ?v7)))
)