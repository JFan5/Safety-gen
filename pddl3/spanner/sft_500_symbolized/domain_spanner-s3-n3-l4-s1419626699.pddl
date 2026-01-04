(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_3 type_2 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v1 - type_5 ?v4 - type_4)
	(pred_6 ?v1 - type_3 ?v2 - type_1)
	(pred_5 ?v2 - type_1)
	(pred_4 ?v6 - type_4 ?v3 - type_4)
	(pred_3 ?v5 - type_2)
	(pred_1 ?v5 - type_2))                                                                                           
(:action op_1 
        :parameters (?v8 - type_4 ?v7 - type_4 ?v1 - type_3)
        :precondition (and (pred_2 ?v1 ?v8) 
                           (pred_4 ?v8 ?v7))                                                          
        :effect (and (not (pred_2 ?v1 ?v8)) (pred_2 ?v1 ?v7)))

(:action op_3 
        :parameters (?v4 - type_4 ?v2 - type_1 ?v1 - type_3)
        :precondition (and (pred_2 ?v1 ?v4) 
                           (pred_2 ?v2 ?v4))
        :effect (and (not (pred_2 ?v2 ?v4))
                     (pred_6 ?v1 ?v2)))

(:action op_2 
        :parameters (?v4 - type_4 ?v2 - type_1 ?v1 - type_3 ?v5 - type_2)
        :precondition (and (pred_2 ?v1 ?v4) 
		      	   (pred_2 ?v5 ?v4)
			   (pred_6 ?v1 ?v2)
			   (pred_5 ?v2)
			   (pred_1 ?v5))
        :effect (and (not (pred_1 ?v5))(not (pred_5 ?v2)) (pred_3 ?v5)))
)