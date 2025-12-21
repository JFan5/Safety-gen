(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_4 type_3 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_5 ?v8 - type_2)
	(pred_3 ?v7 - type_4 ?v5 - type_1)
	(pred_1 ?v5 - type_1)
	(pred_6 ?v6 - type_2 ?v4 - type_2)
	(pred_5 ?v2 - type_3)
	(pred_4 ?v2 - type_3))                                                                                           
(:action op_2 
        :parameters (?v1 - type_2 ?v3 - type_2 ?v7 - type_4)
        :precondition (and (pred_2 ?v7 ?v1) 
                           (pred_6 ?v1 ?v3))                                                          
        :effect (and (not (pred_2 ?v7 ?v1)) (pred_2 ?v7 ?v3)))

(:action op_3 
        :parameters (?v8 - type_2 ?v5 - type_1 ?v7 - type_4)
        :precondition (and (pred_2 ?v7 ?v8) 
                           (pred_2 ?v5 ?v8))
        :effect (and (not (pred_2 ?v5 ?v8))
                     (pred_3 ?v7 ?v5)))

(:action op_1 
        :parameters (?v8 - type_2 ?v5 - type_1 ?v7 - type_4 ?v2 - type_3)
        :precondition (and (pred_2 ?v7 ?v8) 
		      	   (pred_2 ?v2 ?v8)
			   (pred_3 ?v7 ?v5)
			   (pred_1 ?v5)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_1 ?v5)) (pred_5 ?v2)))
)