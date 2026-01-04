(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_2 type_1 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v8 - type_4 ?v5 - type_5)
	(pred_2 ?v8 - type_2 ?v1 - type_3)
	(pred_6 ?v1 - type_3)
	(pred_4 ?v4 - type_5 ?v3 - type_5)
	(pred_5 ?v7 - type_1)
	(pred_3 ?v7 - type_1))                                                                                           
(:action op_1 
        :parameters (?v2 - type_5 ?v6 - type_5 ?v8 - type_2)
        :precondition (and (pred_1 ?v8 ?v2) 
                           (pred_4 ?v2 ?v6))                                                          
        :effect (and (not (pred_1 ?v8 ?v2)) (pred_1 ?v8 ?v6)))

(:action op_2 
        :parameters (?v5 - type_5 ?v1 - type_3 ?v8 - type_2)
        :precondition (and (pred_1 ?v8 ?v5) 
                           (pred_1 ?v1 ?v5))
        :effect (and (not (pred_1 ?v1 ?v5))
                     (pred_2 ?v8 ?v1)))

(:action op_3 
        :parameters (?v5 - type_5 ?v1 - type_3 ?v8 - type_2 ?v7 - type_1)
        :precondition (and (pred_1 ?v8 ?v5) 
		      	   (pred_1 ?v7 ?v5)
			   (pred_2 ?v8 ?v1)
			   (pred_6 ?v1)
			   (pred_3 ?v7))
        :effect (and (not (pred_3 ?v7))(not (pred_6 ?v1)) (pred_5 ?v7)))
)