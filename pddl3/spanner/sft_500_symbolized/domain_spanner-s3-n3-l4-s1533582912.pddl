(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_4 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_5 ?v5 - type_2)
	(pred_1 ?v7 - type_4 ?v8 - type_3)
	(pred_6 ?v8 - type_3)
	(pred_3 ?v3 - type_2 ?v1 - type_2)
	(pred_4 ?v2 - type_1)
	(pred_5 ?v2 - type_1))                                                                                           
(:action op_1 
        :parameters (?v4 - type_2 ?v6 - type_2 ?v7 - type_4)
        :precondition (and (pred_2 ?v7 ?v4) 
                           (pred_3 ?v4 ?v6))                                                          
        :effect (and (not (pred_2 ?v7 ?v4)) (pred_2 ?v7 ?v6)))

(:action op_2 
        :parameters (?v5 - type_2 ?v8 - type_3 ?v7 - type_4)
        :precondition (and (pred_2 ?v7 ?v5) 
                           (pred_2 ?v8 ?v5))
        :effect (and (not (pred_2 ?v8 ?v5))
                     (pred_1 ?v7 ?v8)))

(:action op_3 
        :parameters (?v5 - type_2 ?v8 - type_3 ?v7 - type_4 ?v2 - type_1)
        :precondition (and (pred_2 ?v7 ?v5) 
		      	   (pred_2 ?v2 ?v5)
			   (pred_1 ?v7 ?v8)
			   (pred_6 ?v8)
			   (pred_5 ?v2))
        :effect (and (not (pred_5 ?v2))(not (pred_6 ?v8)) (pred_4 ?v2)))
)