(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_4 type_2 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v7 - type_3 ?v4 - type_1)
	(pred_3 ?v7 - type_4 ?v3 - type_5)
	(pred_6 ?v3 - type_5)
	(pred_1 ?v6 - type_1 ?v2 - type_1)
	(pred_2 ?v5 - type_2)
	(pred_4 ?v5 - type_2))                                                                                           
(:action op_2 
        :parameters (?v8 - type_1 ?v1 - type_1 ?v7 - type_4)
        :precondition (and (pred_5 ?v7 ?v8) 
                           (pred_1 ?v8 ?v1))                                                          
        :effect (and (not (pred_5 ?v7 ?v8)) (pred_5 ?v7 ?v1)))

(:action op_3 
        :parameters (?v4 - type_1 ?v3 - type_5 ?v7 - type_4)
        :precondition (and (pred_5 ?v7 ?v4) 
                           (pred_5 ?v3 ?v4))
        :effect (and (not (pred_5 ?v3 ?v4))
                     (pred_3 ?v7 ?v3)))

(:action op_1 
        :parameters (?v4 - type_1 ?v3 - type_5 ?v7 - type_4 ?v5 - type_2)
        :precondition (and (pred_5 ?v7 ?v4) 
		      	   (pred_5 ?v5 ?v4)
			   (pred_3 ?v7 ?v3)
			   (pred_6 ?v3)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_6 ?v3)) (pred_2 ?v5)))
)