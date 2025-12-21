(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_2 type_4 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v4 - type_5 ?v5 - type_1)
	(pred_3 ?v4 - type_2 ?v7 - type_3)
	(pred_2 ?v7 - type_3)
	(pred_6 ?v8 - type_1 ?v2 - type_1)
	(pred_5 ?v1 - type_4)
	(pred_1 ?v1 - type_4))                                                                                           
(:action op_1 
        :parameters (?v3 - type_1 ?v6 - type_1 ?v4 - type_2)
        :precondition (and (pred_4 ?v4 ?v3) 
                           (pred_6 ?v3 ?v6))                                                          
        :effect (and (not (pred_4 ?v4 ?v3)) (pred_4 ?v4 ?v6)))

(:action op_3 
        :parameters (?v5 - type_1 ?v7 - type_3 ?v4 - type_2)
        :precondition (and (pred_4 ?v4 ?v5) 
                           (pred_4 ?v7 ?v5))
        :effect (and (not (pred_4 ?v7 ?v5))
                     (pred_3 ?v4 ?v7)))

(:action op_2 
        :parameters (?v5 - type_1 ?v7 - type_3 ?v4 - type_2 ?v1 - type_4)
        :precondition (and (pred_4 ?v4 ?v5) 
		      	   (pred_4 ?v1 ?v5)
			   (pred_3 ?v4 ?v7)
			   (pred_2 ?v7)
			   (pred_1 ?v1))
        :effect (and (not (pred_1 ?v1))(not (pred_2 ?v7)) (pred_5 ?v1)))
)