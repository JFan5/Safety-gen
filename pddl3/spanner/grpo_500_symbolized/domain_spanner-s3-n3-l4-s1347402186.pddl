(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_3 type_4 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v1 - type_5 ?v8 - type_2)
	(pred_2 ?v1 - type_3 ?v3 - type_1)
	(pred_1 ?v3 - type_1)
	(pred_3 ?v5 - type_2 ?v7 - type_2)
	(pred_6 ?v2 - type_4)
	(pred_5 ?v2 - type_4))                                                                                           
(:action op_3 
        :parameters (?v6 - type_2 ?v4 - type_2 ?v1 - type_3)
        :precondition (and (pred_4 ?v1 ?v6) 
                           (pred_3 ?v6 ?v4))                                                          
        :effect (and (not (pred_4 ?v1 ?v6)) (pred_4 ?v1 ?v4)))

(:action op_2 
        :parameters (?v8 - type_2 ?v3 - type_1 ?v1 - type_3)
        :precondition (and (pred_4 ?v1 ?v8) 
                           (pred_4 ?v3 ?v8))
        :effect (and (not (pred_4 ?v3 ?v8))
                     (pred_2 ?v1 ?v3)))

(:action op_1 
        :parameters (?v8 - type_2 ?v3 - type_1 ?v1 - type_3 ?v2 - type_4)
        :precondition (and (pred_4 ?v1 ?v8) 
		      	   (pred_4 ?v2 ?v8)
			   (pred_2 ?v1 ?v3)
			   (pred_1 ?v3)
			   (pred_5 ?v2))
        :effect (and (not (pred_5 ?v2))(not (pred_1 ?v3)) (pred_6 ?v2)))
)