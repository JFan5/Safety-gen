(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_1 type_3 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v1 - type_5 ?v4 - type_2)
	(pred_6 ?v1 - type_1 ?v8 - type_4)
	(pred_1 ?v8 - type_4)
	(pred_4 ?v3 - type_2 ?v2 - type_2)
	(pred_2 ?v7 - type_3)
	(pred_3 ?v7 - type_3))                                                                                           
(:action op_3 
        :parameters (?v6 - type_2 ?v5 - type_2 ?v1 - type_1)
        :precondition (and (pred_5 ?v1 ?v6) 
                           (pred_4 ?v6 ?v5))                                                          
        :effect (and (not (pred_5 ?v1 ?v6)) (pred_5 ?v1 ?v5)))

(:action op_1 
        :parameters (?v4 - type_2 ?v8 - type_4 ?v1 - type_1)
        :precondition (and (pred_5 ?v1 ?v4) 
                           (pred_5 ?v8 ?v4))
        :effect (and (not (pred_5 ?v8 ?v4))
                     (pred_6 ?v1 ?v8)))

(:action op_2 
        :parameters (?v4 - type_2 ?v8 - type_4 ?v1 - type_1 ?v7 - type_3)
        :precondition (and (pred_5 ?v1 ?v4) 
		      	   (pred_5 ?v7 ?v4)
			   (pred_6 ?v1 ?v8)
			   (pred_1 ?v8)
			   (pred_3 ?v7))
        :effect (and (not (pred_3 ?v7))(not (pred_1 ?v8)) (pred_2 ?v7)))
)