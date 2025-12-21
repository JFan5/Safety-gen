(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_1 type_4 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_2 ?v5 - type_3)
	(pred_3 ?v4 - type_1 ?v3 - type_5)
	(pred_4 ?v3 - type_5)
	(pred_1 ?v6 - type_3 ?v8 - type_3)
	(pred_6 ?v1 - type_4)
	(pred_5 ?v1 - type_4))                                                                                           
(:action op_3 
        :parameters (?v7 - type_3 ?v2 - type_3 ?v4 - type_1)
        :precondition (and (pred_2 ?v4 ?v7) 
                           (pred_1 ?v7 ?v2))                                                          
        :effect (and (not (pred_2 ?v4 ?v7)) (pred_2 ?v4 ?v2)))

(:action op_1 
        :parameters (?v5 - type_3 ?v3 - type_5 ?v4 - type_1)
        :precondition (and (pred_2 ?v4 ?v5) 
                           (pred_2 ?v3 ?v5))
        :effect (and (not (pred_2 ?v3 ?v5))
                     (pred_3 ?v4 ?v3)))

(:action op_2 
        :parameters (?v5 - type_3 ?v3 - type_5 ?v4 - type_1 ?v1 - type_4)
        :precondition (and (pred_2 ?v4 ?v5) 
		      	   (pred_2 ?v1 ?v5)
			   (pred_3 ?v4 ?v3)
			   (pred_4 ?v3)
			   (pred_5 ?v1))
        :effect (and (not (pred_5 ?v1))(not (pred_4 ?v3)) (pred_6 ?v1)))
)