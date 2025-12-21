(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_4 type_2 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v7 - type_1 ?v1 - type_3)
	(pred_6 ?v7 - type_4 ?v2 - type_5)
	(pred_5 ?v2 - type_5)
	(pred_1 ?v3 - type_3 ?v5 - type_3)
	(pred_2 ?v8 - type_2)
	(pred_3 ?v8 - type_2))                                                                                           
(:action op_1 
        :parameters (?v4 - type_3 ?v6 - type_3 ?v7 - type_4)
        :precondition (and (pred_4 ?v7 ?v4) 
                           (pred_1 ?v4 ?v6))                                                          
        :effect (and (not (pred_4 ?v7 ?v4)) (pred_4 ?v7 ?v6)))

(:action op_2 
        :parameters (?v1 - type_3 ?v2 - type_5 ?v7 - type_4)
        :precondition (and (pred_4 ?v7 ?v1) 
                           (pred_4 ?v2 ?v1))
        :effect (and (not (pred_4 ?v2 ?v1))
                     (pred_6 ?v7 ?v2)))

(:action op_3 
        :parameters (?v1 - type_3 ?v2 - type_5 ?v7 - type_4 ?v8 - type_2)
        :precondition (and (pred_4 ?v7 ?v1) 
		      	   (pred_4 ?v8 ?v1)
			   (pred_6 ?v7 ?v2)
			   (pred_5 ?v2)
			   (pred_3 ?v8))
        :effect (and (not (pred_3 ?v8))(not (pred_5 ?v2)) (pred_2 ?v8)))
)