(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_3 type_2 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v7 - type_1 ?v1 - type_4)
	(pred_1 ?v7 - type_3 ?v2 - type_5)
	(pred_4 ?v2 - type_5)
	(pred_3 ?v4 - type_4 ?v5 - type_4)
	(pred_2 ?v3 - type_2)
	(pred_6 ?v3 - type_2))                                                                                           
(:action op_2 
        :parameters (?v6 - type_4 ?v8 - type_4 ?v7 - type_3)
        :precondition (and (pred_5 ?v7 ?v6) 
                           (pred_3 ?v6 ?v8))                                                          
        :effect (and (not (pred_5 ?v7 ?v6)) (pred_5 ?v7 ?v8)))

(:action op_1 
        :parameters (?v1 - type_4 ?v2 - type_5 ?v7 - type_3)
        :precondition (and (pred_5 ?v7 ?v1) 
                           (pred_5 ?v2 ?v1))
        :effect (and (not (pred_5 ?v2 ?v1))
                     (pred_1 ?v7 ?v2)))

(:action op_3 
        :parameters (?v1 - type_4 ?v2 - type_5 ?v7 - type_3 ?v3 - type_2)
        :precondition (and (pred_5 ?v7 ?v1) 
		      	   (pred_5 ?v3 ?v1)
			   (pred_1 ?v7 ?v2)
			   (pred_4 ?v2)
			   (pred_6 ?v3))
        :effect (and (not (pred_6 ?v3))(not (pred_4 ?v2)) (pred_2 ?v3)))
)