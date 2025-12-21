(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_1 type_4 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v1 - type_2 ?v2 - type_3)
	(pred_2 ?v1 - type_1 ?v3 - type_5)
	(pred_1 ?v3 - type_5)
	(pred_3 ?v5 - type_3 ?v7 - type_3)
	(pred_4 ?v4 - type_4)
	(pred_6 ?v4 - type_4))                                                                                           
(:action op_3 
        :parameters (?v8 - type_3 ?v6 - type_3 ?v1 - type_1)
        :precondition (and (pred_5 ?v1 ?v8) 
                           (pred_3 ?v8 ?v6))                                                          
        :effect (and (not (pred_5 ?v1 ?v8)) (pred_5 ?v1 ?v6)))

(:action op_2 
        :parameters (?v2 - type_3 ?v3 - type_5 ?v1 - type_1)
        :precondition (and (pred_5 ?v1 ?v2) 
                           (pred_5 ?v3 ?v2))
        :effect (and (not (pred_5 ?v3 ?v2))
                     (pred_2 ?v1 ?v3)))

(:action op_1 
        :parameters (?v2 - type_3 ?v3 - type_5 ?v1 - type_1 ?v4 - type_4)
        :precondition (and (pred_5 ?v1 ?v2) 
		      	   (pred_5 ?v4 ?v2)
			   (pred_2 ?v1 ?v3)
			   (pred_1 ?v3)
			   (pred_6 ?v4))
        :effect (and (not (pred_6 ?v4))(not (pred_1 ?v3)) (pred_4 ?v4)))
)