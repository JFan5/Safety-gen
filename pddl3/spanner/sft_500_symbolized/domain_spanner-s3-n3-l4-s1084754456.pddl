(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_3 type_5 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v8 - type_4 ?v4 - type_2)
	(pred_3 ?v8 - type_3 ?v1 - type_1)
	(pred_6 ?v1 - type_1)
	(pred_2 ?v3 - type_2 ?v5 - type_2)
	(pred_4 ?v6 - type_5)
	(pred_5 ?v6 - type_5))                                                                                           
(:action op_1 
        :parameters (?v7 - type_2 ?v2 - type_2 ?v8 - type_3)
        :precondition (and (pred_1 ?v8 ?v7) 
                           (pred_2 ?v7 ?v2))                                                          
        :effect (and (not (pred_1 ?v8 ?v7)) (pred_1 ?v8 ?v2)))

(:action op_2 
        :parameters (?v4 - type_2 ?v1 - type_1 ?v8 - type_3)
        :precondition (and (pred_1 ?v8 ?v4) 
                           (pred_1 ?v1 ?v4))
        :effect (and (not (pred_1 ?v1 ?v4))
                     (pred_3 ?v8 ?v1)))

(:action op_3 
        :parameters (?v4 - type_2 ?v1 - type_1 ?v8 - type_3 ?v6 - type_5)
        :precondition (and (pred_1 ?v8 ?v4) 
		      	   (pred_1 ?v6 ?v4)
			   (pred_3 ?v8 ?v1)
			   (pred_6 ?v1)
			   (pred_5 ?v6))
        :effect (and (not (pred_5 ?v6))(not (pred_6 ?v1)) (pred_4 ?v6)))
)