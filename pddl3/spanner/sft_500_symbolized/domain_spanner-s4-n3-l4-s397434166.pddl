(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_3 type_4 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v2 - type_5 ?v6 - type_2)
	(pred_1 ?v2 - type_3 ?v3 - type_1)
	(pred_3 ?v3 - type_1)
	(pred_4 ?v5 - type_2 ?v8 - type_2)
	(pred_2 ?v4 - type_4)
	(pred_6 ?v4 - type_4))                                                                                           
(:action op_3 
        :parameters (?v7 - type_2 ?v1 - type_2 ?v2 - type_3)
        :precondition (and (pred_5 ?v2 ?v7) 
                           (pred_4 ?v7 ?v1))                                                          
        :effect (and (not (pred_5 ?v2 ?v7)) (pred_5 ?v2 ?v1)))

(:action op_1 
        :parameters (?v6 - type_2 ?v3 - type_1 ?v2 - type_3)
        :precondition (and (pred_5 ?v2 ?v6) 
                           (pred_5 ?v3 ?v6))
        :effect (and (not (pred_5 ?v3 ?v6))
                     (pred_1 ?v2 ?v3)))

(:action op_2 
        :parameters (?v6 - type_2 ?v3 - type_1 ?v2 - type_3 ?v4 - type_4)
        :precondition (and (pred_5 ?v2 ?v6) 
		      	   (pred_5 ?v4 ?v6)
			   (pred_1 ?v2 ?v3)
			   (pred_3 ?v3)
			   (pred_6 ?v4))
        :effect (and (not (pred_6 ?v4))(not (pred_3 ?v3)) (pred_2 ?v4)))
)