(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_2 type_3 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_4 ?v4 - type_1)
	(pred_5 ?v1 - type_2 ?v8 - type_5)
	(pred_1 ?v8 - type_5)
	(pred_2 ?v2 - type_1 ?v3 - type_1)
	(pred_6 ?v5 - type_3)
	(pred_4 ?v5 - type_3))                                                                                           
(:action op_2 
        :parameters (?v7 - type_1 ?v6 - type_1 ?v1 - type_2)
        :precondition (and (pred_3 ?v1 ?v7) 
                           (pred_2 ?v7 ?v6))                                                          
        :effect (and (not (pred_3 ?v1 ?v7)) (pred_3 ?v1 ?v6)))

(:action op_1 
        :parameters (?v4 - type_1 ?v8 - type_5 ?v1 - type_2)
        :precondition (and (pred_3 ?v1 ?v4) 
                           (pred_3 ?v8 ?v4))
        :effect (and (not (pred_3 ?v8 ?v4))
                     (pred_5 ?v1 ?v8)))

(:action op_3 
        :parameters (?v4 - type_1 ?v8 - type_5 ?v1 - type_2 ?v5 - type_3)
        :precondition (and (pred_3 ?v1 ?v4) 
		      	   (pred_3 ?v5 ?v4)
			   (pred_5 ?v1 ?v8)
			   (pred_1 ?v8)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_1 ?v8)) (pred_6 ?v5)))
)