(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_1 type_3 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v4 - type_5 ?v6 - type_4)
	(pred_6 ?v4 - type_1 ?v7 - type_2)
	(pred_4 ?v7 - type_2)
	(pred_1 ?v3 - type_4 ?v2 - type_4)
	(pred_3 ?v1 - type_3)
	(pred_2 ?v1 - type_3))                                                                                           
(:action op_1 
        :parameters (?v5 - type_4 ?v8 - type_4 ?v4 - type_1)
        :precondition (and (pred_5 ?v4 ?v5) 
                           (pred_1 ?v5 ?v8))                                                          
        :effect (and (not (pred_5 ?v4 ?v5)) (pred_5 ?v4 ?v8)))

(:action op_3 
        :parameters (?v6 - type_4 ?v7 - type_2 ?v4 - type_1)
        :precondition (and (pred_5 ?v4 ?v6) 
                           (pred_5 ?v7 ?v6))
        :effect (and (not (pred_5 ?v7 ?v6))
                     (pred_6 ?v4 ?v7)))

(:action op_2 
        :parameters (?v6 - type_4 ?v7 - type_2 ?v4 - type_1 ?v1 - type_3)
        :precondition (and (pred_5 ?v4 ?v6) 
		      	   (pred_5 ?v1 ?v6)
			   (pred_6 ?v4 ?v7)
			   (pred_4 ?v7)
			   (pred_2 ?v1))
        :effect (and (not (pred_2 ?v1))(not (pred_4 ?v7)) (pred_3 ?v1)))
)