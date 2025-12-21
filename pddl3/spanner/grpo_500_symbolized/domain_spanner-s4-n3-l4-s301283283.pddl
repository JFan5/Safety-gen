(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_5 type_3 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v7 - type_2 ?v1 - type_4)
	(pred_1 ?v7 - type_5 ?v4 - type_1)
	(pred_2 ?v4 - type_1)
	(pred_3 ?v6 - type_4 ?v2 - type_4)
	(pred_5 ?v8 - type_3)
	(pred_6 ?v8 - type_3))                                                                                           
(:action op_1 
        :parameters (?v5 - type_4 ?v3 - type_4 ?v7 - type_5)
        :precondition (and (pred_4 ?v7 ?v5) 
                           (pred_3 ?v5 ?v3))                                                          
        :effect (and (not (pred_4 ?v7 ?v5)) (pred_4 ?v7 ?v3)))

(:action op_3 
        :parameters (?v1 - type_4 ?v4 - type_1 ?v7 - type_5)
        :precondition (and (pred_4 ?v7 ?v1) 
                           (pred_4 ?v4 ?v1))
        :effect (and (not (pred_4 ?v4 ?v1))
                     (pred_1 ?v7 ?v4)))

(:action op_2 
        :parameters (?v1 - type_4 ?v4 - type_1 ?v7 - type_5 ?v8 - type_3)
        :precondition (and (pred_4 ?v7 ?v1) 
		      	   (pred_4 ?v8 ?v1)
			   (pred_1 ?v7 ?v4)
			   (pred_2 ?v4)
			   (pred_6 ?v8))
        :effect (and (not (pred_6 ?v8))(not (pred_2 ?v4)) (pred_5 ?v8)))
)