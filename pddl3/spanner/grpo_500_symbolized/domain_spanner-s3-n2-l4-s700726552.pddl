(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_1 type_5 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v3 - type_3 ?v6 - type_4)
	(pred_6 ?v3 - type_1 ?v2 - type_2)
	(pred_1 ?v2 - type_2)
	(pred_4 ?v4 - type_4 ?v8 - type_4)
	(pred_2 ?v5 - type_5)
	(pred_3 ?v5 - type_5))                                                                                           
(:action op_1 
        :parameters (?v1 - type_4 ?v7 - type_4 ?v3 - type_1)
        :precondition (and (pred_5 ?v3 ?v1) 
                           (pred_4 ?v1 ?v7))                                                          
        :effect (and (not (pred_5 ?v3 ?v1)) (pred_5 ?v3 ?v7)))

(:action op_2 
        :parameters (?v6 - type_4 ?v2 - type_2 ?v3 - type_1)
        :precondition (and (pred_5 ?v3 ?v6) 
                           (pred_5 ?v2 ?v6))
        :effect (and (not (pred_5 ?v2 ?v6))
                     (pred_6 ?v3 ?v2)))

(:action op_3 
        :parameters (?v6 - type_4 ?v2 - type_2 ?v3 - type_1 ?v5 - type_5)
        :precondition (and (pred_5 ?v3 ?v6) 
		      	   (pred_5 ?v5 ?v6)
			   (pred_6 ?v3 ?v2)
			   (pred_1 ?v2)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_1 ?v2)) (pred_2 ?v5)))
)