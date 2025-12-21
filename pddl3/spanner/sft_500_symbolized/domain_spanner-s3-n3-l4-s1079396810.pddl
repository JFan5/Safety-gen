(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_4 type_2 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_1 ?v7 - type_3)
	(pred_1 ?v1 - type_4 ?v2 - type_5)
	(pred_2 ?v2 - type_5)
	(pred_5 ?v8 - type_3 ?v6 - type_3)
	(pred_6 ?v5 - type_2)
	(pred_4 ?v5 - type_2))                                                                                           
(:action op_1 
        :parameters (?v4 - type_3 ?v3 - type_3 ?v1 - type_4)
        :precondition (and (pred_3 ?v1 ?v4) 
                           (pred_5 ?v4 ?v3))                                                          
        :effect (and (not (pred_3 ?v1 ?v4)) (pred_3 ?v1 ?v3)))

(:action op_3 
        :parameters (?v7 - type_3 ?v2 - type_5 ?v1 - type_4)
        :precondition (and (pred_3 ?v1 ?v7) 
                           (pred_3 ?v2 ?v7))
        :effect (and (not (pred_3 ?v2 ?v7))
                     (pred_1 ?v1 ?v2)))

(:action op_2 
        :parameters (?v7 - type_3 ?v2 - type_5 ?v1 - type_4 ?v5 - type_2)
        :precondition (and (pred_3 ?v1 ?v7) 
		      	   (pred_3 ?v5 ?v7)
			   (pred_1 ?v1 ?v2)
			   (pred_2 ?v2)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_2 ?v2)) (pred_6 ?v5)))
)