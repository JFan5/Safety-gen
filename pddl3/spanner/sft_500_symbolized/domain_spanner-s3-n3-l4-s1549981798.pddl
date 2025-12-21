(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_3 type_4 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v7 - type_5 ?v6 - type_1)
	(pred_4 ?v7 - type_3 ?v8 - type_2)
	(pred_2 ?v8 - type_2)
	(pred_1 ?v5 - type_1 ?v3 - type_1)
	(pred_6 ?v2 - type_4)
	(pred_5 ?v2 - type_4))                                                                                           
(:action op_1 
        :parameters (?v1 - type_1 ?v4 - type_1 ?v7 - type_3)
        :precondition (and (pred_3 ?v7 ?v1) 
                           (pred_1 ?v1 ?v4))                                                          
        :effect (and (not (pred_3 ?v7 ?v1)) (pred_3 ?v7 ?v4)))

(:action op_2 
        :parameters (?v6 - type_1 ?v8 - type_2 ?v7 - type_3)
        :precondition (and (pred_3 ?v7 ?v6) 
                           (pred_3 ?v8 ?v6))
        :effect (and (not (pred_3 ?v8 ?v6))
                     (pred_4 ?v7 ?v8)))

(:action op_3 
        :parameters (?v6 - type_1 ?v8 - type_2 ?v7 - type_3 ?v2 - type_4)
        :precondition (and (pred_3 ?v7 ?v6) 
		      	   (pred_3 ?v2 ?v6)
			   (pred_4 ?v7 ?v8)
			   (pred_2 ?v8)
			   (pred_5 ?v2))
        :effect (and (not (pred_5 ?v2))(not (pred_2 ?v8)) (pred_6 ?v2)))
)