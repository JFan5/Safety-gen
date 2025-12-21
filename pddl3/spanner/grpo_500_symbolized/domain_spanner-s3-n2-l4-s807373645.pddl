(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_3 type_2 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v4 - type_4 ?v8 - type_5)
	(pred_1 ?v4 - type_3 ?v6 - type_1)
	(pred_6 ?v6 - type_1)
	(pred_4 ?v3 - type_5 ?v1 - type_5)
	(pred_5 ?v5 - type_2)
	(pred_2 ?v5 - type_2))                                                                                           
(:action op_2 
        :parameters (?v7 - type_5 ?v2 - type_5 ?v4 - type_3)
        :precondition (and (pred_3 ?v4 ?v7) 
                           (pred_4 ?v7 ?v2))                                                          
        :effect (and (not (pred_3 ?v4 ?v7)) (pred_3 ?v4 ?v2)))

(:action op_1 
        :parameters (?v8 - type_5 ?v6 - type_1 ?v4 - type_3)
        :precondition (and (pred_3 ?v4 ?v8) 
                           (pred_3 ?v6 ?v8))
        :effect (and (not (pred_3 ?v6 ?v8))
                     (pred_1 ?v4 ?v6)))

(:action op_3 
        :parameters (?v8 - type_5 ?v6 - type_1 ?v4 - type_3 ?v5 - type_2)
        :precondition (and (pred_3 ?v4 ?v8) 
		      	   (pred_3 ?v5 ?v8)
			   (pred_1 ?v4 ?v6)
			   (pred_6 ?v6)
			   (pred_2 ?v5))
        :effect (and (not (pred_2 ?v5))(not (pred_6 ?v6)) (pred_5 ?v5)))
)