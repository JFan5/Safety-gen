(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_4 type_1 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v8 - type_3 ?v6 - type_5)
	(pred_5 ?v8 - type_4 ?v4 - type_2)
	(pred_4 ?v4 - type_2)
	(pred_3 ?v5 - type_5 ?v2 - type_5)
	(pred_6 ?v3 - type_1)
	(pred_1 ?v3 - type_1))                                                                                           
(:action op_2 
        :parameters (?v1 - type_5 ?v7 - type_5 ?v8 - type_4)
        :precondition (and (pred_2 ?v8 ?v1) 
                           (pred_3 ?v1 ?v7))                                                          
        :effect (and (not (pred_2 ?v8 ?v1)) (pred_2 ?v8 ?v7)))

(:action op_1 
        :parameters (?v6 - type_5 ?v4 - type_2 ?v8 - type_4)
        :precondition (and (pred_2 ?v8 ?v6) 
                           (pred_2 ?v4 ?v6))
        :effect (and (not (pred_2 ?v4 ?v6))
                     (pred_5 ?v8 ?v4)))

(:action op_3 
        :parameters (?v6 - type_5 ?v4 - type_2 ?v8 - type_4 ?v3 - type_1)
        :precondition (and (pred_2 ?v8 ?v6) 
		      	   (pred_2 ?v3 ?v6)
			   (pred_5 ?v8 ?v4)
			   (pred_4 ?v4)
			   (pred_1 ?v3))
        :effect (and (not (pred_1 ?v3))(not (pred_4 ?v4)) (pred_6 ?v3)))
)