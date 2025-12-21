(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_1 type_2 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_4 ?v6 - type_5)
	(pred_1 ?v8 - type_1 ?v3 - type_3)
	(pred_6 ?v3 - type_3)
	(pred_4 ?v2 - type_5 ?v4 - type_5)
	(pred_2 ?v5 - type_2)
	(pred_3 ?v5 - type_2))                                                                                           
(:action op_1 
        :parameters (?v7 - type_5 ?v1 - type_5 ?v8 - type_1)
        :precondition (and (pred_5 ?v8 ?v7) 
                           (pred_4 ?v7 ?v1))                                                          
        :effect (and (not (pred_5 ?v8 ?v7)) (pred_5 ?v8 ?v1)))

(:action op_2 
        :parameters (?v6 - type_5 ?v3 - type_3 ?v8 - type_1)
        :precondition (and (pred_5 ?v8 ?v6) 
                           (pred_5 ?v3 ?v6))
        :effect (and (not (pred_5 ?v3 ?v6))
                     (pred_1 ?v8 ?v3)))

(:action op_3 
        :parameters (?v6 - type_5 ?v3 - type_3 ?v8 - type_1 ?v5 - type_2)
        :precondition (and (pred_5 ?v8 ?v6) 
		      	   (pred_5 ?v5 ?v6)
			   (pred_1 ?v8 ?v3)
			   (pred_6 ?v3)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_6 ?v3)) (pred_2 ?v5)))
)