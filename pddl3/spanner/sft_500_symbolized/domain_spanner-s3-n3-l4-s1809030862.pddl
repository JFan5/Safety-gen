(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_3 type_1 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v2 - type_4 ?v1 - type_5)
	(pred_3 ?v2 - type_3 ?v8 - type_2)
	(pred_2 ?v8 - type_2)
	(pred_6 ?v6 - type_5 ?v4 - type_5)
	(pred_4 ?v3 - type_1)
	(pred_5 ?v3 - type_1))                                                                                           
(:action op_1 
        :parameters (?v5 - type_5 ?v7 - type_5 ?v2 - type_3)
        :precondition (and (pred_1 ?v2 ?v5) 
                           (pred_6 ?v5 ?v7))                                                          
        :effect (and (not (pred_1 ?v2 ?v5)) (pred_1 ?v2 ?v7)))

(:action op_2 
        :parameters (?v1 - type_5 ?v8 - type_2 ?v2 - type_3)
        :precondition (and (pred_1 ?v2 ?v1) 
                           (pred_1 ?v8 ?v1))
        :effect (and (not (pred_1 ?v8 ?v1))
                     (pred_3 ?v2 ?v8)))

(:action op_3 
        :parameters (?v1 - type_5 ?v8 - type_2 ?v2 - type_3 ?v3 - type_1)
        :precondition (and (pred_1 ?v2 ?v1) 
		      	   (pred_1 ?v3 ?v1)
			   (pred_3 ?v2 ?v8)
			   (pred_2 ?v8)
			   (pred_5 ?v3))
        :effect (and (not (pred_5 ?v3))(not (pred_2 ?v8)) (pred_4 ?v3)))
)