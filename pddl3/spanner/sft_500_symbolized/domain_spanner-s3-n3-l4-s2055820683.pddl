(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_2 type_3 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v3 - type_4 ?v5 - type_5)
	(pred_3 ?v3 - type_2 ?v8 - type_1)
	(pred_6 ?v8 - type_1)
	(pred_2 ?v1 - type_5 ?v4 - type_5)
	(pred_1 ?v6 - type_3)
	(pred_5 ?v6 - type_3))                                                                                           
(:action op_2 
        :parameters (?v7 - type_5 ?v2 - type_5 ?v3 - type_2)
        :precondition (and (pred_4 ?v3 ?v7) 
                           (pred_2 ?v7 ?v2))                                                          
        :effect (and (not (pred_4 ?v3 ?v7)) (pred_4 ?v3 ?v2)))

(:action op_3 
        :parameters (?v5 - type_5 ?v8 - type_1 ?v3 - type_2)
        :precondition (and (pred_4 ?v3 ?v5) 
                           (pred_4 ?v8 ?v5))
        :effect (and (not (pred_4 ?v8 ?v5))
                     (pred_3 ?v3 ?v8)))

(:action op_1 
        :parameters (?v5 - type_5 ?v8 - type_1 ?v3 - type_2 ?v6 - type_3)
        :precondition (and (pred_4 ?v3 ?v5) 
		      	   (pred_4 ?v6 ?v5)
			   (pred_3 ?v3 ?v8)
			   (pred_6 ?v8)
			   (pred_5 ?v6))
        :effect (and (not (pred_5 ?v6))(not (pred_6 ?v8)) (pred_1 ?v6)))
)