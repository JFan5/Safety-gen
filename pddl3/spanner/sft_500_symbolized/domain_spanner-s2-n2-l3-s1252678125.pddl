(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_1 type_3 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v3 - type_5 ?v6 - type_2)
	(pred_6 ?v3 - type_1 ?v8 - type_4)
	(pred_3 ?v8 - type_4)
	(pred_2 ?v1 - type_2 ?v5 - type_2)
	(pred_1 ?v4 - type_3)
	(pred_4 ?v4 - type_3))                                                                                           
(:action op_2 
        :parameters (?v7 - type_2 ?v2 - type_2 ?v3 - type_1)
        :precondition (and (pred_5 ?v3 ?v7) 
                           (pred_2 ?v7 ?v2))                                                          
        :effect (and (not (pred_5 ?v3 ?v7)) (pred_5 ?v3 ?v2)))

(:action op_3 
        :parameters (?v6 - type_2 ?v8 - type_4 ?v3 - type_1)
        :precondition (and (pred_5 ?v3 ?v6) 
                           (pred_5 ?v8 ?v6))
        :effect (and (not (pred_5 ?v8 ?v6))
                     (pred_6 ?v3 ?v8)))

(:action op_1 
        :parameters (?v6 - type_2 ?v8 - type_4 ?v3 - type_1 ?v4 - type_3)
        :precondition (and (pred_5 ?v3 ?v6) 
		      	   (pred_5 ?v4 ?v6)
			   (pred_6 ?v3 ?v8)
			   (pred_3 ?v8)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_3 ?v8)) (pred_1 ?v4)))
)