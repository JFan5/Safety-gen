(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_3 type_1 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v5 - type_5 ?v2 - type_4)
	(pred_3 ?v5 - type_3 ?v3 - type_2)
	(pred_1 ?v3 - type_2)
	(pred_2 ?v4 - type_4 ?v6 - type_4)
	(pred_5 ?v1 - type_1)
	(pred_4 ?v1 - type_1))                                                                                           
(:action op_1 
        :parameters (?v8 - type_4 ?v7 - type_4 ?v5 - type_3)
        :precondition (and (pred_6 ?v5 ?v8) 
                           (pred_2 ?v8 ?v7))                                                          
        :effect (and (not (pred_6 ?v5 ?v8)) (pred_6 ?v5 ?v7)))

(:action op_2 
        :parameters (?v2 - type_4 ?v3 - type_2 ?v5 - type_3)
        :precondition (and (pred_6 ?v5 ?v2) 
                           (pred_6 ?v3 ?v2))
        :effect (and (not (pred_6 ?v3 ?v2))
                     (pred_3 ?v5 ?v3)))

(:action op_3 
        :parameters (?v2 - type_4 ?v3 - type_2 ?v5 - type_3 ?v1 - type_1)
        :precondition (and (pred_6 ?v5 ?v2) 
		      	   (pred_6 ?v1 ?v2)
			   (pred_3 ?v5 ?v3)
			   (pred_1 ?v3)
			   (pred_4 ?v1))
        :effect (and (not (pred_4 ?v1))(not (pred_1 ?v3)) (pred_5 ?v1)))
)