(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_4 type_1 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v4 - type_2 ?v2 - type_3)
	(pred_6 ?v4 - type_4 ?v3 - type_5)
	(pred_2 ?v3 - type_5)
	(pred_5 ?v6 - type_3 ?v1 - type_3)
	(pred_3 ?v5 - type_1)
	(pred_4 ?v5 - type_1))                                                                                           
(:action op_3 
        :parameters (?v8 - type_3 ?v7 - type_3 ?v4 - type_4)
        :precondition (and (pred_1 ?v4 ?v8) 
                           (pred_5 ?v8 ?v7))                                                          
        :effect (and (not (pred_1 ?v4 ?v8)) (pred_1 ?v4 ?v7)))

(:action op_2 
        :parameters (?v2 - type_3 ?v3 - type_5 ?v4 - type_4)
        :precondition (and (pred_1 ?v4 ?v2) 
                           (pred_1 ?v3 ?v2))
        :effect (and (not (pred_1 ?v3 ?v2))
                     (pred_6 ?v4 ?v3)))

(:action op_1 
        :parameters (?v2 - type_3 ?v3 - type_5 ?v4 - type_4 ?v5 - type_1)
        :precondition (and (pred_1 ?v4 ?v2) 
		      	   (pred_1 ?v5 ?v2)
			   (pred_6 ?v4 ?v3)
			   (pred_2 ?v3)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_2 ?v3)) (pred_3 ?v5)))
)