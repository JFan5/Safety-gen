(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_4 type_2 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v1 - type_3 ?v4 - type_5)
	(pred_1 ?v1 - type_4 ?v7 - type_1)
	(pred_3 ?v7 - type_1)
	(pred_2 ?v8 - type_5 ?v2 - type_5)
	(pred_5 ?v6 - type_2)
	(pred_6 ?v6 - type_2))                                                                                           
(:action op_1 
        :parameters (?v5 - type_5 ?v3 - type_5 ?v1 - type_4)
        :precondition (and (pred_4 ?v1 ?v5) 
                           (pred_2 ?v5 ?v3))                                                          
        :effect (and (not (pred_4 ?v1 ?v5)) (pred_4 ?v1 ?v3)))

(:action op_3 
        :parameters (?v4 - type_5 ?v7 - type_1 ?v1 - type_4)
        :precondition (and (pred_4 ?v1 ?v4) 
                           (pred_4 ?v7 ?v4))
        :effect (and (not (pred_4 ?v7 ?v4))
                     (pred_1 ?v1 ?v7)))

(:action op_2 
        :parameters (?v4 - type_5 ?v7 - type_1 ?v1 - type_4 ?v6 - type_2)
        :precondition (and (pred_4 ?v1 ?v4) 
		      	   (pred_4 ?v6 ?v4)
			   (pred_1 ?v1 ?v7)
			   (pred_3 ?v7)
			   (pred_6 ?v6))
        :effect (and (not (pred_6 ?v6))(not (pred_3 ?v7)) (pred_5 ?v6)))
)