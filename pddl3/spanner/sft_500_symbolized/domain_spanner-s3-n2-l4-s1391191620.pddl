(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_5 type_4 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v8 - type_2 ?v3 - type_3)
	(pred_5 ?v8 - type_5 ?v7 - type_1)
	(pred_3 ?v7 - type_1)
	(pred_4 ?v6 - type_3 ?v4 - type_3)
	(pred_1 ?v2 - type_4)
	(pred_2 ?v2 - type_4))                                                                                           
(:action op_2 
        :parameters (?v1 - type_3 ?v5 - type_3 ?v8 - type_5)
        :precondition (and (pred_6 ?v8 ?v1) 
                           (pred_4 ?v1 ?v5))                                                          
        :effect (and (not (pred_6 ?v8 ?v1)) (pred_6 ?v8 ?v5)))

(:action op_3 
        :parameters (?v3 - type_3 ?v7 - type_1 ?v8 - type_5)
        :precondition (and (pred_6 ?v8 ?v3) 
                           (pred_6 ?v7 ?v3))
        :effect (and (not (pred_6 ?v7 ?v3))
                     (pred_5 ?v8 ?v7)))

(:action op_1 
        :parameters (?v3 - type_3 ?v7 - type_1 ?v8 - type_5 ?v2 - type_4)
        :precondition (and (pred_6 ?v8 ?v3) 
		      	   (pred_6 ?v2 ?v3)
			   (pred_5 ?v8 ?v7)
			   (pred_3 ?v7)
			   (pred_2 ?v2))
        :effect (and (not (pred_2 ?v2))(not (pred_3 ?v7)) (pred_1 ?v2)))
)