(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_1 type_2 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v5 - type_3 ?v2 - type_4)
	(pred_5 ?v5 - type_1 ?v3 - type_5)
	(pred_4 ?v3 - type_5)
	(pred_1 ?v8 - type_4 ?v4 - type_4)
	(pred_2 ?v1 - type_2)
	(pred_6 ?v1 - type_2))                                                                                           
(:action op_3 
        :parameters (?v6 - type_4 ?v7 - type_4 ?v5 - type_1)
        :precondition (and (pred_3 ?v5 ?v6) 
                           (pred_1 ?v6 ?v7))                                                          
        :effect (and (not (pred_3 ?v5 ?v6)) (pred_3 ?v5 ?v7)))

(:action op_1 
        :parameters (?v2 - type_4 ?v3 - type_5 ?v5 - type_1)
        :precondition (and (pred_3 ?v5 ?v2) 
                           (pred_3 ?v3 ?v2))
        :effect (and (not (pred_3 ?v3 ?v2))
                     (pred_5 ?v5 ?v3)))

(:action op_2 
        :parameters (?v2 - type_4 ?v3 - type_5 ?v5 - type_1 ?v1 - type_2)
        :precondition (and (pred_3 ?v5 ?v2) 
		      	   (pred_3 ?v1 ?v2)
			   (pred_5 ?v5 ?v3)
			   (pred_4 ?v3)
			   (pred_6 ?v1))
        :effect (and (not (pred_6 ?v1))(not (pred_4 ?v3)) (pred_2 ?v1)))
)