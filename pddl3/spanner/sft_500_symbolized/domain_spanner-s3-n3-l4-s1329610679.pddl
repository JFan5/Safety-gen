(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_4 type_5 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v1 - type_2 ?v6 - type_1)
	(pred_4 ?v1 - type_4 ?v8 - type_3)
	(pred_3 ?v8 - type_3)
	(pred_5 ?v3 - type_1 ?v5 - type_1)
	(pred_6 ?v2 - type_5)
	(pred_2 ?v2 - type_5))                                                                                           
(:action op_2 
        :parameters (?v4 - type_1 ?v7 - type_1 ?v1 - type_4)
        :precondition (and (pred_1 ?v1 ?v4) 
                           (pred_5 ?v4 ?v7))                                                          
        :effect (and (not (pred_1 ?v1 ?v4)) (pred_1 ?v1 ?v7)))

(:action op_3 
        :parameters (?v6 - type_1 ?v8 - type_3 ?v1 - type_4)
        :precondition (and (pred_1 ?v1 ?v6) 
                           (pred_1 ?v8 ?v6))
        :effect (and (not (pred_1 ?v8 ?v6))
                     (pred_4 ?v1 ?v8)))

(:action op_1 
        :parameters (?v6 - type_1 ?v8 - type_3 ?v1 - type_4 ?v2 - type_5)
        :precondition (and (pred_1 ?v1 ?v6) 
		      	   (pred_1 ?v2 ?v6)
			   (pred_4 ?v1 ?v8)
			   (pred_3 ?v8)
			   (pred_2 ?v2))
        :effect (and (not (pred_2 ?v2))(not (pred_3 ?v8)) (pred_6 ?v2)))
)