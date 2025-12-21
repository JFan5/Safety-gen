(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_1 type_4 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v8 - type_5 ?v7 - type_3)
	(pred_2 ?v8 - type_1 ?v4 - type_2)
	(pred_4 ?v4 - type_2)
	(pred_3 ?v1 - type_3 ?v3 - type_3)
	(pred_6 ?v5 - type_4)
	(pred_5 ?v5 - type_4))                                                                                           
(:action op_3 
        :parameters (?v6 - type_3 ?v2 - type_3 ?v8 - type_1)
        :precondition (and (pred_1 ?v8 ?v6) 
                           (pred_3 ?v6 ?v2))                                                          
        :effect (and (not (pred_1 ?v8 ?v6)) (pred_1 ?v8 ?v2)))

(:action op_1 
        :parameters (?v7 - type_3 ?v4 - type_2 ?v8 - type_1)
        :precondition (and (pred_1 ?v8 ?v7) 
                           (pred_1 ?v4 ?v7))
        :effect (and (not (pred_1 ?v4 ?v7))
                     (pred_2 ?v8 ?v4)))

(:action op_2 
        :parameters (?v7 - type_3 ?v4 - type_2 ?v8 - type_1 ?v5 - type_4)
        :precondition (and (pred_1 ?v8 ?v7) 
		      	   (pred_1 ?v5 ?v7)
			   (pred_2 ?v8 ?v4)
			   (pred_4 ?v4)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_4 ?v4)) (pred_6 ?v5)))
)