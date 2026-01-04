(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_1 type_5 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v8 - type_4 ?v1 - type_2)
	(pred_2 ?v8 - type_1 ?v5 - type_3)
	(pred_5 ?v5 - type_3)
	(pred_4 ?v6 - type_2 ?v7 - type_2)
	(pred_6 ?v4 - type_5)
	(pred_3 ?v4 - type_5))                                                                                           
(:action op_3 
        :parameters (?v2 - type_2 ?v3 - type_2 ?v8 - type_1)
        :precondition (and (pred_1 ?v8 ?v2) 
                           (pred_4 ?v2 ?v3))                                                          
        :effect (and (not (pred_1 ?v8 ?v2)) (pred_1 ?v8 ?v3)))

(:action op_1 
        :parameters (?v1 - type_2 ?v5 - type_3 ?v8 - type_1)
        :precondition (and (pred_1 ?v8 ?v1) 
                           (pred_1 ?v5 ?v1))
        :effect (and (not (pred_1 ?v5 ?v1))
                     (pred_2 ?v8 ?v5)))

(:action op_2 
        :parameters (?v1 - type_2 ?v5 - type_3 ?v8 - type_1 ?v4 - type_5)
        :precondition (and (pred_1 ?v8 ?v1) 
		      	   (pred_1 ?v4 ?v1)
			   (pred_2 ?v8 ?v5)
			   (pred_5 ?v5)
			   (pred_3 ?v4))
        :effect (and (not (pred_3 ?v4))(not (pred_5 ?v5)) (pred_6 ?v4)))
)