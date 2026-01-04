(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_1 type_2 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v8 - type_5 ?v4 - type_4)
	(pred_3 ?v8 - type_1 ?v1 - type_3)
	(pred_5 ?v1 - type_3)
	(pred_6 ?v5 - type_4 ?v2 - type_4)
	(pred_2 ?v7 - type_2)
	(pred_4 ?v7 - type_2))                                                                                           
(:action op_3 
        :parameters (?v6 - type_4 ?v3 - type_4 ?v8 - type_1)
        :precondition (and (pred_1 ?v8 ?v6) 
                           (pred_6 ?v6 ?v3))                                                          
        :effect (and (not (pred_1 ?v8 ?v6)) (pred_1 ?v8 ?v3)))

(:action op_2 
        :parameters (?v4 - type_4 ?v1 - type_3 ?v8 - type_1)
        :precondition (and (pred_1 ?v8 ?v4) 
                           (pred_1 ?v1 ?v4))
        :effect (and (not (pred_1 ?v1 ?v4))
                     (pred_3 ?v8 ?v1)))

(:action op_1 
        :parameters (?v4 - type_4 ?v1 - type_3 ?v8 - type_1 ?v7 - type_2)
        :precondition (and (pred_1 ?v8 ?v4) 
		      	   (pred_1 ?v7 ?v4)
			   (pred_3 ?v8 ?v1)
			   (pred_5 ?v1)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_5 ?v1)) (pred_2 ?v7)))
)