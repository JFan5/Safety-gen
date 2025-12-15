(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_5 type_1 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v1 - type_4 ?v6 - type_2)
	(pred_4 ?v1 - type_5 ?v5 - type_3)
	(pred_6 ?v5 - type_3)
	(pred_1 ?v2 - type_2 ?v8 - type_2)
	(pred_3 ?v3 - type_1)
	(pred_2 ?v3 - type_1))                                                                                           
(:action op_2 
        :parameters (?v4 - type_2 ?v7 - type_2 ?v1 - type_5)
        :precondition (and (pred_5 ?v1 ?v4) 
                           (pred_1 ?v4 ?v7))                                                          
        :effect (and (not (pred_5 ?v1 ?v4)) (pred_5 ?v1 ?v7)))

(:action op_3 
        :parameters (?v6 - type_2 ?v5 - type_3 ?v1 - type_5)
        :precondition (and (pred_5 ?v1 ?v6) 
                           (pred_5 ?v5 ?v6))
        :effect (and (not (pred_5 ?v5 ?v6))
                     (pred_4 ?v1 ?v5)))

(:action op_1 
        :parameters (?v6 - type_2 ?v5 - type_3 ?v1 - type_5 ?v3 - type_1)
        :precondition (and (pred_5 ?v1 ?v6) 
		      	   (pred_5 ?v3 ?v6)
			   (pred_4 ?v1 ?v5)
			   (pred_6 ?v5)
			   (pred_2 ?v3))
        :effect (and (not (pred_2 ?v3))(not (pred_6 ?v5)) (pred_3 ?v3)))
)