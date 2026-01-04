(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_3 type_1 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_4 ?v4 - type_5)
	(pred_5 ?v7 - type_3 ?v3 - type_2)
	(pred_6 ?v3 - type_2)
	(pred_4 ?v1 - type_5 ?v8 - type_5)
	(pred_1 ?v2 - type_1)
	(pred_3 ?v2 - type_1))                                                                                           
(:action op_2 
        :parameters (?v5 - type_5 ?v6 - type_5 ?v7 - type_3)
        :precondition (and (pred_2 ?v7 ?v5) 
                           (pred_4 ?v5 ?v6))                                                          
        :effect (and (not (pred_2 ?v7 ?v5)) (pred_2 ?v7 ?v6)))

(:action op_1 
        :parameters (?v4 - type_5 ?v3 - type_2 ?v7 - type_3)
        :precondition (and (pred_2 ?v7 ?v4) 
                           (pred_2 ?v3 ?v4))
        :effect (and (not (pred_2 ?v3 ?v4))
                     (pred_5 ?v7 ?v3)))

(:action op_3 
        :parameters (?v4 - type_5 ?v3 - type_2 ?v7 - type_3 ?v2 - type_1)
        :precondition (and (pred_2 ?v7 ?v4) 
		      	   (pred_2 ?v2 ?v4)
			   (pred_5 ?v7 ?v3)
			   (pred_6 ?v3)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_6 ?v3)) (pred_1 ?v2)))
)