(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_5 type_4 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_2 ?v8 - type_3)
	(pred_2 ?v5 - type_5 ?v4 - type_1)
	(pred_1 ?v4 - type_1)
	(pred_6 ?v1 - type_3 ?v7 - type_3)
	(pred_3 ?v3 - type_4)
	(pred_5 ?v3 - type_4))                                                                                           
(:action op_2 
        :parameters (?v6 - type_3 ?v2 - type_3 ?v5 - type_5)
        :precondition (and (pred_4 ?v5 ?v6) 
                           (pred_6 ?v6 ?v2))                                                          
        :effect (and (not (pred_4 ?v5 ?v6)) (pred_4 ?v5 ?v2)))

(:action op_1 
        :parameters (?v8 - type_3 ?v4 - type_1 ?v5 - type_5)
        :precondition (and (pred_4 ?v5 ?v8) 
                           (pred_4 ?v4 ?v8))
        :effect (and (not (pred_4 ?v4 ?v8))
                     (pred_2 ?v5 ?v4)))

(:action op_3 
        :parameters (?v8 - type_3 ?v4 - type_1 ?v5 - type_5 ?v3 - type_4)
        :precondition (and (pred_4 ?v5 ?v8) 
		      	   (pred_4 ?v3 ?v8)
			   (pred_2 ?v5 ?v4)
			   (pred_1 ?v4)
			   (pred_5 ?v3))
        :effect (and (not (pred_5 ?v3))(not (pred_1 ?v4)) (pred_3 ?v3)))
)