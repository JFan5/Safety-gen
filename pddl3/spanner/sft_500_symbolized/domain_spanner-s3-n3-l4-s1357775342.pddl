(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_3 type_2 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v8 - type_5 ?v7 - type_1)
	(pred_5 ?v8 - type_3 ?v4 - type_4)
	(pred_3 ?v4 - type_4)
	(pred_1 ?v5 - type_1 ?v6 - type_1)
	(pred_6 ?v1 - type_2)
	(pred_4 ?v1 - type_2))                                                                                           
(:action op_1 
        :parameters (?v3 - type_1 ?v2 - type_1 ?v8 - type_3)
        :precondition (and (pred_2 ?v8 ?v3) 
                           (pred_1 ?v3 ?v2))                                                          
        :effect (and (not (pred_2 ?v8 ?v3)) (pred_2 ?v8 ?v2)))

(:action op_2 
        :parameters (?v7 - type_1 ?v4 - type_4 ?v8 - type_3)
        :precondition (and (pred_2 ?v8 ?v7) 
                           (pred_2 ?v4 ?v7))
        :effect (and (not (pred_2 ?v4 ?v7))
                     (pred_5 ?v8 ?v4)))

(:action op_3 
        :parameters (?v7 - type_1 ?v4 - type_4 ?v8 - type_3 ?v1 - type_2)
        :precondition (and (pred_2 ?v8 ?v7) 
		      	   (pred_2 ?v1 ?v7)
			   (pred_5 ?v8 ?v4)
			   (pred_3 ?v4)
			   (pred_4 ?v1))
        :effect (and (not (pred_4 ?v1))(not (pred_3 ?v4)) (pred_6 ?v1)))
)