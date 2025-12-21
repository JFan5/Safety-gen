(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_4 type_3 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v1 - type_1 ?v6 - type_5)
	(pred_3 ?v1 - type_4 ?v5 - type_2)
	(pred_5 ?v5 - type_2)
	(pred_1 ?v3 - type_5 ?v8 - type_5)
	(pred_2 ?v2 - type_3)
	(pred_4 ?v2 - type_3))                                                                                           
(:action op_3 
        :parameters (?v7 - type_5 ?v4 - type_5 ?v1 - type_4)
        :precondition (and (pred_6 ?v1 ?v7) 
                           (pred_1 ?v7 ?v4))                                                          
        :effect (and (not (pred_6 ?v1 ?v7)) (pred_6 ?v1 ?v4)))

(:action op_1 
        :parameters (?v6 - type_5 ?v5 - type_2 ?v1 - type_4)
        :precondition (and (pred_6 ?v1 ?v6) 
                           (pred_6 ?v5 ?v6))
        :effect (and (not (pred_6 ?v5 ?v6))
                     (pred_3 ?v1 ?v5)))

(:action op_2 
        :parameters (?v6 - type_5 ?v5 - type_2 ?v1 - type_4 ?v2 - type_3)
        :precondition (and (pred_6 ?v1 ?v6) 
		      	   (pred_6 ?v2 ?v6)
			   (pred_3 ?v1 ?v5)
			   (pred_5 ?v5)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_5 ?v5)) (pred_2 ?v2)))
)