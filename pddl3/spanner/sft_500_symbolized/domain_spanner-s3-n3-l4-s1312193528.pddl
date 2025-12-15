(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_1 type_5 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v3 - type_3 ?v7 - type_4)
	(pred_3 ?v3 - type_1 ?v8 - type_2)
	(pred_2 ?v8 - type_2)
	(pred_4 ?v6 - type_4 ?v5 - type_4)
	(pred_6 ?v2 - type_5)
	(pred_5 ?v2 - type_5))                                                                                           
(:action op_1 
        :parameters (?v4 - type_4 ?v1 - type_4 ?v3 - type_1)
        :precondition (and (pred_1 ?v3 ?v4) 
                           (pred_4 ?v4 ?v1))                                                          
        :effect (and (not (pred_1 ?v3 ?v4)) (pred_1 ?v3 ?v1)))

(:action op_3 
        :parameters (?v7 - type_4 ?v8 - type_2 ?v3 - type_1)
        :precondition (and (pred_1 ?v3 ?v7) 
                           (pred_1 ?v8 ?v7))
        :effect (and (not (pred_1 ?v8 ?v7))
                     (pred_3 ?v3 ?v8)))

(:action op_2 
        :parameters (?v7 - type_4 ?v8 - type_2 ?v3 - type_1 ?v2 - type_5)
        :precondition (and (pred_1 ?v3 ?v7) 
		      	   (pred_1 ?v2 ?v7)
			   (pred_3 ?v3 ?v8)
			   (pred_2 ?v8)
			   (pred_5 ?v2))
        :effect (and (not (pred_5 ?v2))(not (pred_2 ?v8)) (pred_6 ?v2)))
)