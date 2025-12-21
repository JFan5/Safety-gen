(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_4 type_5 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v7 - type_2 ?v2 - type_1)
	(pred_3 ?v7 - type_4 ?v8 - type_3)
	(pred_5 ?v8 - type_3)
	(pred_6 ?v3 - type_1 ?v1 - type_1)
	(pred_2 ?v4 - type_5)
	(pred_4 ?v4 - type_5))                                                                                           
(:action op_2 
        :parameters (?v5 - type_1 ?v6 - type_1 ?v7 - type_4)
        :precondition (and (pred_1 ?v7 ?v5) 
                           (pred_6 ?v5 ?v6))                                                          
        :effect (and (not (pred_1 ?v7 ?v5)) (pred_1 ?v7 ?v6)))

(:action op_3 
        :parameters (?v2 - type_1 ?v8 - type_3 ?v7 - type_4)
        :precondition (and (pred_1 ?v7 ?v2) 
                           (pred_1 ?v8 ?v2))
        :effect (and (not (pred_1 ?v8 ?v2))
                     (pred_3 ?v7 ?v8)))

(:action op_1 
        :parameters (?v2 - type_1 ?v8 - type_3 ?v7 - type_4 ?v4 - type_5)
        :precondition (and (pred_1 ?v7 ?v2) 
		      	   (pred_1 ?v4 ?v2)
			   (pred_3 ?v7 ?v8)
			   (pred_5 ?v8)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_5 ?v8)) (pred_2 ?v4)))
)