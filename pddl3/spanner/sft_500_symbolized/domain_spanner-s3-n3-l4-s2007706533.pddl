(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_5 type_2 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v1 - type_1 ?v5 - type_4)
	(pred_5 ?v1 - type_5 ?v7 - type_3)
	(pred_3 ?v7 - type_3)
	(pred_2 ?v3 - type_4 ?v4 - type_4)
	(pred_1 ?v6 - type_2)
	(pred_4 ?v6 - type_2))                                                                                           
(:action op_2 
        :parameters (?v8 - type_4 ?v2 - type_4 ?v1 - type_5)
        :precondition (and (pred_6 ?v1 ?v8) 
                           (pred_2 ?v8 ?v2))                                                          
        :effect (and (not (pred_6 ?v1 ?v8)) (pred_6 ?v1 ?v2)))

(:action op_3 
        :parameters (?v5 - type_4 ?v7 - type_3 ?v1 - type_5)
        :precondition (and (pred_6 ?v1 ?v5) 
                           (pred_6 ?v7 ?v5))
        :effect (and (not (pred_6 ?v7 ?v5))
                     (pred_5 ?v1 ?v7)))

(:action op_1 
        :parameters (?v5 - type_4 ?v7 - type_3 ?v1 - type_5 ?v6 - type_2)
        :precondition (and (pred_6 ?v1 ?v5) 
		      	   (pred_6 ?v6 ?v5)
			   (pred_5 ?v1 ?v7)
			   (pred_3 ?v7)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_3 ?v7)) (pred_1 ?v6)))
)