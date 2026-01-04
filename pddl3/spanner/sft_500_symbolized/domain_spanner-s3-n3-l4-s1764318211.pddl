(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_2 type_1 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_3 ?v5 - type_4)
	(pred_6 ?v7 - type_2 ?v8 - type_5)
	(pred_4 ?v8 - type_5)
	(pred_1 ?v6 - type_4 ?v3 - type_4)
	(pred_3 ?v1 - type_1)
	(pred_5 ?v1 - type_1))                                                                                           
(:action op_2 
        :parameters (?v2 - type_4 ?v4 - type_4 ?v7 - type_2)
        :precondition (and (pred_2 ?v7 ?v2) 
                           (pred_1 ?v2 ?v4))                                                          
        :effect (and (not (pred_2 ?v7 ?v2)) (pred_2 ?v7 ?v4)))

(:action op_3 
        :parameters (?v5 - type_4 ?v8 - type_5 ?v7 - type_2)
        :precondition (and (pred_2 ?v7 ?v5) 
                           (pred_2 ?v8 ?v5))
        :effect (and (not (pred_2 ?v8 ?v5))
                     (pred_6 ?v7 ?v8)))

(:action op_1 
        :parameters (?v5 - type_4 ?v8 - type_5 ?v7 - type_2 ?v1 - type_1)
        :precondition (and (pred_2 ?v7 ?v5) 
		      	   (pred_2 ?v1 ?v5)
			   (pred_6 ?v7 ?v8)
			   (pred_4 ?v8)
			   (pred_5 ?v1))
        :effect (and (not (pred_5 ?v1))(not (pred_4 ?v8)) (pred_3 ?v1)))
)