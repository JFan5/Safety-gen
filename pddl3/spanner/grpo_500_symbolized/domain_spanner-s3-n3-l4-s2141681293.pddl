(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_5 type_2 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v1 - type_4 ?v3 - type_1)
	(pred_2 ?v1 - type_5 ?v5 - type_3)
	(pred_5 ?v5 - type_3)
	(pred_4 ?v4 - type_1 ?v8 - type_1)
	(pred_3 ?v7 - type_2)
	(pred_1 ?v7 - type_2))                                                                                           
(:action op_3 
        :parameters (?v2 - type_1 ?v6 - type_1 ?v1 - type_5)
        :precondition (and (pred_6 ?v1 ?v2) 
                           (pred_4 ?v2 ?v6))                                                          
        :effect (and (not (pred_6 ?v1 ?v2)) (pred_6 ?v1 ?v6)))

(:action op_2 
        :parameters (?v3 - type_1 ?v5 - type_3 ?v1 - type_5)
        :precondition (and (pred_6 ?v1 ?v3) 
                           (pred_6 ?v5 ?v3))
        :effect (and (not (pred_6 ?v5 ?v3))
                     (pred_2 ?v1 ?v5)))

(:action op_1 
        :parameters (?v3 - type_1 ?v5 - type_3 ?v1 - type_5 ?v7 - type_2)
        :precondition (and (pred_6 ?v1 ?v3) 
		      	   (pred_6 ?v7 ?v3)
			   (pred_2 ?v1 ?v5)
			   (pred_5 ?v5)
			   (pred_1 ?v7))
        :effect (and (not (pred_1 ?v7))(not (pred_5 ?v5)) (pred_3 ?v7)))
)