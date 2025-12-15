(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_4 type_2 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v4 - type_3 ?v2 - type_1)
	(pred_1 ?v4 - type_4 ?v5 - type_5)
	(pred_6 ?v5 - type_5)
	(pred_5 ?v1 - type_1 ?v7 - type_1)
	(pred_3 ?v3 - type_2)
	(pred_2 ?v3 - type_2))                                                                                           
(:action op_2 
        :parameters (?v8 - type_1 ?v6 - type_1 ?v4 - type_4)
        :precondition (and (pred_4 ?v4 ?v8) 
                           (pred_5 ?v8 ?v6))                                                          
        :effect (and (not (pred_4 ?v4 ?v8)) (pred_4 ?v4 ?v6)))

(:action op_1 
        :parameters (?v2 - type_1 ?v5 - type_5 ?v4 - type_4)
        :precondition (and (pred_4 ?v4 ?v2) 
                           (pred_4 ?v5 ?v2))
        :effect (and (not (pred_4 ?v5 ?v2))
                     (pred_1 ?v4 ?v5)))

(:action op_3 
        :parameters (?v2 - type_1 ?v5 - type_5 ?v4 - type_4 ?v3 - type_2)
        :precondition (and (pred_4 ?v4 ?v2) 
		      	   (pred_4 ?v3 ?v2)
			   (pred_1 ?v4 ?v5)
			   (pred_6 ?v5)
			   (pred_2 ?v3))
        :effect (and (not (pred_2 ?v3))(not (pred_6 ?v5)) (pred_3 ?v3)))
)