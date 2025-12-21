(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_4 type_5 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_2 ?v2 - type_3)
	(pred_5 ?v5 - type_4 ?v8 - type_1)
	(pred_2 ?v8 - type_1)
	(pred_1 ?v4 - type_3 ?v3 - type_3)
	(pred_6 ?v7 - type_5)
	(pred_3 ?v7 - type_5))                                                                                           
(:action op_2 
        :parameters (?v1 - type_3 ?v6 - type_3 ?v5 - type_4)
        :precondition (and (pred_4 ?v5 ?v1) 
                           (pred_1 ?v1 ?v6))                                                          
        :effect (and (not (pred_4 ?v5 ?v1)) (pred_4 ?v5 ?v6)))

(:action op_1 
        :parameters (?v2 - type_3 ?v8 - type_1 ?v5 - type_4)
        :precondition (and (pred_4 ?v5 ?v2) 
                           (pred_4 ?v8 ?v2))
        :effect (and (not (pred_4 ?v8 ?v2))
                     (pred_5 ?v5 ?v8)))

(:action op_3 
        :parameters (?v2 - type_3 ?v8 - type_1 ?v5 - type_4 ?v7 - type_5)
        :precondition (and (pred_4 ?v5 ?v2) 
		      	   (pred_4 ?v7 ?v2)
			   (pred_5 ?v5 ?v8)
			   (pred_2 ?v8)
			   (pred_3 ?v7))
        :effect (and (not (pred_3 ?v7))(not (pred_2 ?v8)) (pred_6 ?v7)))
)