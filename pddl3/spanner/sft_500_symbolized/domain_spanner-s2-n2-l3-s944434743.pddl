(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_4 type_2 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v3 - type_1 ?v4 - type_3)
	(pred_6 ?v3 - type_4 ?v7 - type_5)
	(pred_5 ?v7 - type_5)
	(pred_1 ?v1 - type_3 ?v2 - type_3)
	(pred_4 ?v5 - type_2)
	(pred_2 ?v5 - type_2))                                                                                           
(:action op_2 
        :parameters (?v6 - type_3 ?v8 - type_3 ?v3 - type_4)
        :precondition (and (pred_3 ?v3 ?v6) 
                           (pred_1 ?v6 ?v8))                                                          
        :effect (and (not (pred_3 ?v3 ?v6)) (pred_3 ?v3 ?v8)))

(:action op_1 
        :parameters (?v4 - type_3 ?v7 - type_5 ?v3 - type_4)
        :precondition (and (pred_3 ?v3 ?v4) 
                           (pred_3 ?v7 ?v4))
        :effect (and (not (pred_3 ?v7 ?v4))
                     (pred_6 ?v3 ?v7)))

(:action op_3 
        :parameters (?v4 - type_3 ?v7 - type_5 ?v3 - type_4 ?v5 - type_2)
        :precondition (and (pred_3 ?v3 ?v4) 
		      	   (pred_3 ?v5 ?v4)
			   (pred_6 ?v3 ?v7)
			   (pred_5 ?v7)
			   (pred_2 ?v5))
        :effect (and (not (pred_2 ?v5))(not (pred_5 ?v7)) (pred_4 ?v5)))
)