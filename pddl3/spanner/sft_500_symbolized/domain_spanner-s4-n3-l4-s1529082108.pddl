(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_4 type_1 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v1 - type_3 ?v7 - type_5)
	(pred_4 ?v1 - type_4 ?v8 - type_2)
	(pred_3 ?v8 - type_2)
	(pred_6 ?v3 - type_5 ?v6 - type_5)
	(pred_1 ?v5 - type_1)
	(pred_5 ?v5 - type_1))                                                                                           
(:action op_1 
        :parameters (?v4 - type_5 ?v2 - type_5 ?v1 - type_4)
        :precondition (and (pred_2 ?v1 ?v4) 
                           (pred_6 ?v4 ?v2))                                                          
        :effect (and (not (pred_2 ?v1 ?v4)) (pred_2 ?v1 ?v2)))

(:action op_3 
        :parameters (?v7 - type_5 ?v8 - type_2 ?v1 - type_4)
        :precondition (and (pred_2 ?v1 ?v7) 
                           (pred_2 ?v8 ?v7))
        :effect (and (not (pred_2 ?v8 ?v7))
                     (pred_4 ?v1 ?v8)))

(:action op_2 
        :parameters (?v7 - type_5 ?v8 - type_2 ?v1 - type_4 ?v5 - type_1)
        :precondition (and (pred_2 ?v1 ?v7) 
		      	   (pred_2 ?v5 ?v7)
			   (pred_4 ?v1 ?v8)
			   (pred_3 ?v8)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_3 ?v8)) (pred_1 ?v5)))
)