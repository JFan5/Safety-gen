(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_4 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_5 ?v1 - type_2)
	(pred_3 ?v5 - type_4 ?v3 - type_3)
	(pred_1 ?v3 - type_3)
	(pred_6 ?v8 - type_2 ?v2 - type_2)
	(pred_2 ?v4 - type_1)
	(pred_5 ?v4 - type_1))                                                                                           
(:action op_1 
        :parameters (?v6 - type_2 ?v7 - type_2 ?v5 - type_4)
        :precondition (and (pred_4 ?v5 ?v6) 
                           (pred_6 ?v6 ?v7))                                                          
        :effect (and (not (pred_4 ?v5 ?v6)) (pred_4 ?v5 ?v7)))

(:action op_3 
        :parameters (?v1 - type_2 ?v3 - type_3 ?v5 - type_4)
        :precondition (and (pred_4 ?v5 ?v1) 
                           (pred_4 ?v3 ?v1))
        :effect (and (not (pred_4 ?v3 ?v1))
                     (pred_3 ?v5 ?v3)))

(:action op_2 
        :parameters (?v1 - type_2 ?v3 - type_3 ?v5 - type_4 ?v4 - type_1)
        :precondition (and (pred_4 ?v5 ?v1) 
		      	   (pred_4 ?v4 ?v1)
			   (pred_3 ?v5 ?v3)
			   (pred_1 ?v3)
			   (pred_5 ?v4))
        :effect (and (not (pred_5 ?v4))(not (pred_1 ?v3)) (pred_2 ?v4)))
)