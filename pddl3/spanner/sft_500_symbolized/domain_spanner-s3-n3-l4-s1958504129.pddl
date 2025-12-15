(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_5 type_1 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_3 ?v4 - type_4)
	(pred_1 ?v3 - type_5 ?v2 - type_2)
	(pred_4 ?v2 - type_2)
	(pred_5 ?v1 - type_4 ?v6 - type_4)
	(pred_3 ?v7 - type_1)
	(pred_6 ?v7 - type_1))                                                                                           
(:action op_2 
        :parameters (?v8 - type_4 ?v5 - type_4 ?v3 - type_5)
        :precondition (and (pred_2 ?v3 ?v8) 
                           (pred_5 ?v8 ?v5))                                                          
        :effect (and (not (pred_2 ?v3 ?v8)) (pred_2 ?v3 ?v5)))

(:action op_3 
        :parameters (?v4 - type_4 ?v2 - type_2 ?v3 - type_5)
        :precondition (and (pred_2 ?v3 ?v4) 
                           (pred_2 ?v2 ?v4))
        :effect (and (not (pred_2 ?v2 ?v4))
                     (pred_1 ?v3 ?v2)))

(:action op_1 
        :parameters (?v4 - type_4 ?v2 - type_2 ?v3 - type_5 ?v7 - type_1)
        :precondition (and (pred_2 ?v3 ?v4) 
		      	   (pred_2 ?v7 ?v4)
			   (pred_1 ?v3 ?v2)
			   (pred_4 ?v2)
			   (pred_6 ?v7))
        :effect (and (not (pred_6 ?v7))(not (pred_4 ?v2)) (pred_3 ?v7)))
)