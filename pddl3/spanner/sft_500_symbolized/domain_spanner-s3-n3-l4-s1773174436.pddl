(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_5 type_3 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_1 ?v5 - type_4)
	(pred_1 ?v4 - type_5 ?v7 - type_2)
	(pred_6 ?v7 - type_2)
	(pred_3 ?v2 - type_4 ?v3 - type_4)
	(pred_5 ?v8 - type_3)
	(pred_4 ?v8 - type_3))                                                                                           
(:action op_1 
        :parameters (?v6 - type_4 ?v1 - type_4 ?v4 - type_5)
        :precondition (and (pred_2 ?v4 ?v6) 
                           (pred_3 ?v6 ?v1))                                                          
        :effect (and (not (pred_2 ?v4 ?v6)) (pred_2 ?v4 ?v1)))

(:action op_3 
        :parameters (?v5 - type_4 ?v7 - type_2 ?v4 - type_5)
        :precondition (and (pred_2 ?v4 ?v5) 
                           (pred_2 ?v7 ?v5))
        :effect (and (not (pred_2 ?v7 ?v5))
                     (pred_1 ?v4 ?v7)))

(:action op_2 
        :parameters (?v5 - type_4 ?v7 - type_2 ?v4 - type_5 ?v8 - type_3)
        :precondition (and (pred_2 ?v4 ?v5) 
		      	   (pred_2 ?v8 ?v5)
			   (pred_1 ?v4 ?v7)
			   (pred_6 ?v7)
			   (pred_4 ?v8))
        :effect (and (not (pred_4 ?v8))(not (pred_6 ?v7)) (pred_5 ?v8)))
)