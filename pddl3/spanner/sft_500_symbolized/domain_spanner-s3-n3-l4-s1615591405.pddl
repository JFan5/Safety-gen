(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_5 type_2 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v6 - type_3 ?v4 - type_4)
	(pred_3 ?v6 - type_5 ?v7 - type_1)
	(pred_5 ?v7 - type_1)
	(pred_6 ?v5 - type_4 ?v1 - type_4)
	(pred_4 ?v2 - type_2)
	(pred_2 ?v2 - type_2))                                                                                           
(:action op_1 
        :parameters (?v3 - type_4 ?v8 - type_4 ?v6 - type_5)
        :precondition (and (pred_1 ?v6 ?v3) 
                           (pred_6 ?v3 ?v8))                                                          
        :effect (and (not (pred_1 ?v6 ?v3)) (pred_1 ?v6 ?v8)))

(:action op_2 
        :parameters (?v4 - type_4 ?v7 - type_1 ?v6 - type_5)
        :precondition (and (pred_1 ?v6 ?v4) 
                           (pred_1 ?v7 ?v4))
        :effect (and (not (pred_1 ?v7 ?v4))
                     (pred_3 ?v6 ?v7)))

(:action op_3 
        :parameters (?v4 - type_4 ?v7 - type_1 ?v6 - type_5 ?v2 - type_2)
        :precondition (and (pred_1 ?v6 ?v4) 
		      	   (pred_1 ?v2 ?v4)
			   (pred_3 ?v6 ?v7)
			   (pred_5 ?v7)
			   (pred_2 ?v2))
        :effect (and (not (pred_2 ?v2))(not (pred_5 ?v7)) (pred_4 ?v2)))
)