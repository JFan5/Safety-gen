(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_4 type_2 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v2 - type_1 ?v7 - type_5)
	(pred_6 ?v2 - type_4 ?v3 - type_3)
	(pred_2 ?v3 - type_3)
	(pred_5 ?v5 - type_5 ?v8 - type_5)
	(pred_4 ?v4 - type_2)
	(pred_3 ?v4 - type_2))                                                                                           
(:action op_1 
        :parameters (?v6 - type_5 ?v1 - type_5 ?v2 - type_4)
        :precondition (and (pred_1 ?v2 ?v6) 
                           (pred_5 ?v6 ?v1))                                                          
        :effect (and (not (pred_1 ?v2 ?v6)) (pred_1 ?v2 ?v1)))

(:action op_2 
        :parameters (?v7 - type_5 ?v3 - type_3 ?v2 - type_4)
        :precondition (and (pred_1 ?v2 ?v7) 
                           (pred_1 ?v3 ?v7))
        :effect (and (not (pred_1 ?v3 ?v7))
                     (pred_6 ?v2 ?v3)))

(:action op_3 
        :parameters (?v7 - type_5 ?v3 - type_3 ?v2 - type_4 ?v4 - type_2)
        :precondition (and (pred_1 ?v2 ?v7) 
		      	   (pred_1 ?v4 ?v7)
			   (pred_6 ?v2 ?v3)
			   (pred_2 ?v3)
			   (pred_3 ?v4))
        :effect (and (not (pred_3 ?v4))(not (pred_2 ?v3)) (pred_4 ?v4)))
)