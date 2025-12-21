(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_4 type_3 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v1 - type_1 ?v7 - type_5)
	(pred_4 ?v1 - type_4 ?v3 - type_2)
	(pred_6 ?v3 - type_2)
	(pred_5 ?v5 - type_5 ?v6 - type_5)
	(pred_3 ?v2 - type_3)
	(pred_1 ?v2 - type_3))                                                                                           
(:action op_2 
        :parameters (?v8 - type_5 ?v4 - type_5 ?v1 - type_4)
        :precondition (and (pred_2 ?v1 ?v8) 
                           (pred_5 ?v8 ?v4))                                                          
        :effect (and (not (pred_2 ?v1 ?v8)) (pred_2 ?v1 ?v4)))

(:action op_3 
        :parameters (?v7 - type_5 ?v3 - type_2 ?v1 - type_4)
        :precondition (and (pred_2 ?v1 ?v7) 
                           (pred_2 ?v3 ?v7))
        :effect (and (not (pred_2 ?v3 ?v7))
                     (pred_4 ?v1 ?v3)))

(:action op_1 
        :parameters (?v7 - type_5 ?v3 - type_2 ?v1 - type_4 ?v2 - type_3)
        :precondition (and (pred_2 ?v1 ?v7) 
		      	   (pred_2 ?v2 ?v7)
			   (pred_4 ?v1 ?v3)
			   (pred_6 ?v3)
			   (pred_1 ?v2))
        :effect (and (not (pred_1 ?v2))(not (pred_6 ?v3)) (pred_3 ?v2)))
)