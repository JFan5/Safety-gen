(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_4 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v2 - type_5 ?v5 - type_2)
	(pred_5 ?v2 - type_4 ?v7 - type_3)
	(pred_1 ?v7 - type_3)
	(pred_3 ?v1 - type_2 ?v8 - type_2)
	(pred_2 ?v6 - type_1)
	(pred_6 ?v6 - type_1))                                                                                           
(:action op_1 
        :parameters (?v4 - type_2 ?v3 - type_2 ?v2 - type_4)
        :precondition (and (pred_4 ?v2 ?v4) 
                           (pred_3 ?v4 ?v3))                                                          
        :effect (and (not (pred_4 ?v2 ?v4)) (pred_4 ?v2 ?v3)))

(:action op_2 
        :parameters (?v5 - type_2 ?v7 - type_3 ?v2 - type_4)
        :precondition (and (pred_4 ?v2 ?v5) 
                           (pred_4 ?v7 ?v5))
        :effect (and (not (pred_4 ?v7 ?v5))
                     (pred_5 ?v2 ?v7)))

(:action op_3 
        :parameters (?v5 - type_2 ?v7 - type_3 ?v2 - type_4 ?v6 - type_1)
        :precondition (and (pred_4 ?v2 ?v5) 
		      	   (pred_4 ?v6 ?v5)
			   (pred_5 ?v2 ?v7)
			   (pred_1 ?v7)
			   (pred_6 ?v6))
        :effect (and (not (pred_6 ?v6))(not (pred_1 ?v7)) (pred_2 ?v6)))
)