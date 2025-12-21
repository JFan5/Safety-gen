(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_4 type_5 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v3 - type_1 ?v6 - type_3)
	(pred_2 ?v3 - type_4 ?v1 - type_2)
	(pred_6 ?v1 - type_2)
	(pred_3 ?v5 - type_3 ?v4 - type_3)
	(pred_1 ?v2 - type_5)
	(pred_4 ?v2 - type_5))                                                                                           
(:action op_3 
        :parameters (?v8 - type_3 ?v7 - type_3 ?v3 - type_4)
        :precondition (and (pred_5 ?v3 ?v8) 
                           (pred_3 ?v8 ?v7))                                                          
        :effect (and (not (pred_5 ?v3 ?v8)) (pred_5 ?v3 ?v7)))

(:action op_2 
        :parameters (?v6 - type_3 ?v1 - type_2 ?v3 - type_4)
        :precondition (and (pred_5 ?v3 ?v6) 
                           (pred_5 ?v1 ?v6))
        :effect (and (not (pred_5 ?v1 ?v6))
                     (pred_2 ?v3 ?v1)))

(:action op_1 
        :parameters (?v6 - type_3 ?v1 - type_2 ?v3 - type_4 ?v2 - type_5)
        :precondition (and (pred_5 ?v3 ?v6) 
		      	   (pred_5 ?v2 ?v6)
			   (pred_2 ?v3 ?v1)
			   (pred_6 ?v1)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_6 ?v1)) (pred_1 ?v2)))
)