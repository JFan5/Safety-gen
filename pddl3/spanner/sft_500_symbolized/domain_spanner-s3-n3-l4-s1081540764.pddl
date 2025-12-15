(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_5 type_4 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v7 - type_3 ?v1 - type_2)
	(pred_4 ?v7 - type_5 ?v2 - type_1)
	(pred_6 ?v2 - type_1)
	(pred_2 ?v5 - type_2 ?v3 - type_2)
	(pred_1 ?v8 - type_4)
	(pred_5 ?v8 - type_4))                                                                                           
(:action op_3 
        :parameters (?v6 - type_2 ?v4 - type_2 ?v7 - type_5)
        :precondition (and (pred_3 ?v7 ?v6) 
                           (pred_2 ?v6 ?v4))                                                          
        :effect (and (not (pred_3 ?v7 ?v6)) (pred_3 ?v7 ?v4)))

(:action op_2 
        :parameters (?v1 - type_2 ?v2 - type_1 ?v7 - type_5)
        :precondition (and (pred_3 ?v7 ?v1) 
                           (pred_3 ?v2 ?v1))
        :effect (and (not (pred_3 ?v2 ?v1))
                     (pred_4 ?v7 ?v2)))

(:action op_1 
        :parameters (?v1 - type_2 ?v2 - type_1 ?v7 - type_5 ?v8 - type_4)
        :precondition (and (pred_3 ?v7 ?v1) 
		      	   (pred_3 ?v8 ?v1)
			   (pred_4 ?v7 ?v2)
			   (pred_6 ?v2)
			   (pred_5 ?v8))
        :effect (and (not (pred_5 ?v8))(not (pred_6 ?v2)) (pred_1 ?v8)))
)