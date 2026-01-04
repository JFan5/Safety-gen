(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_4 type_3 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v4 - type_1 ?v5 - type_2)
	(pred_5 ?v4 - type_4 ?v8 - type_5)
	(pred_4 ?v8 - type_5)
	(pred_6 ?v3 - type_2 ?v1 - type_2)
	(pred_1 ?v2 - type_3)
	(pred_2 ?v2 - type_3))                                                                                           
(:action op_3 
        :parameters (?v6 - type_2 ?v7 - type_2 ?v4 - type_4)
        :precondition (and (pred_3 ?v4 ?v6) 
                           (pred_6 ?v6 ?v7))                                                          
        :effect (and (not (pred_3 ?v4 ?v6)) (pred_3 ?v4 ?v7)))

(:action op_1 
        :parameters (?v5 - type_2 ?v8 - type_5 ?v4 - type_4)
        :precondition (and (pred_3 ?v4 ?v5) 
                           (pred_3 ?v8 ?v5))
        :effect (and (not (pred_3 ?v8 ?v5))
                     (pred_5 ?v4 ?v8)))

(:action op_2 
        :parameters (?v5 - type_2 ?v8 - type_5 ?v4 - type_4 ?v2 - type_3)
        :precondition (and (pred_3 ?v4 ?v5) 
		      	   (pred_3 ?v2 ?v5)
			   (pred_5 ?v4 ?v8)
			   (pred_4 ?v8)
			   (pred_2 ?v2))
        :effect (and (not (pred_2 ?v2))(not (pred_4 ?v8)) (pred_1 ?v2)))
)