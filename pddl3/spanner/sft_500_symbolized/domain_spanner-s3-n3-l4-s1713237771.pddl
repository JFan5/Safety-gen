(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_2 type_4 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v4 - type_1 ?v3 - type_5)
	(pred_3 ?v4 - type_2 ?v7 - type_3)
	(pred_1 ?v7 - type_3)
	(pred_6 ?v1 - type_5 ?v2 - type_5)
	(pred_4 ?v5 - type_4)
	(pred_2 ?v5 - type_4))                                                                                           
(:action op_3 
        :parameters (?v8 - type_5 ?v6 - type_5 ?v4 - type_2)
        :precondition (and (pred_5 ?v4 ?v8) 
                           (pred_6 ?v8 ?v6))                                                          
        :effect (and (not (pred_5 ?v4 ?v8)) (pred_5 ?v4 ?v6)))

(:action op_2 
        :parameters (?v3 - type_5 ?v7 - type_3 ?v4 - type_2)
        :precondition (and (pred_5 ?v4 ?v3) 
                           (pred_5 ?v7 ?v3))
        :effect (and (not (pred_5 ?v7 ?v3))
                     (pred_3 ?v4 ?v7)))

(:action op_1 
        :parameters (?v3 - type_5 ?v7 - type_3 ?v4 - type_2 ?v5 - type_4)
        :precondition (and (pred_5 ?v4 ?v3) 
		      	   (pred_5 ?v5 ?v3)
			   (pred_3 ?v4 ?v7)
			   (pred_1 ?v7)
			   (pred_2 ?v5))
        :effect (and (not (pred_2 ?v5))(not (pred_1 ?v7)) (pred_4 ?v5)))
)