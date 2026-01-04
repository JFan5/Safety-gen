(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_1 type_4 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v7 - type_3 ?v6 - type_5)
	(pred_6 ?v7 - type_1 ?v5 - type_2)
	(pred_5 ?v5 - type_2)
	(pred_3 ?v3 - type_5 ?v4 - type_5)
	(pred_4 ?v8 - type_4)
	(pred_2 ?v8 - type_4))                                                                                           
(:action op_2 
        :parameters (?v1 - type_5 ?v2 - type_5 ?v7 - type_1)
        :precondition (and (pred_1 ?v7 ?v1) 
                           (pred_3 ?v1 ?v2))                                                          
        :effect (and (not (pred_1 ?v7 ?v1)) (pred_1 ?v7 ?v2)))

(:action op_3 
        :parameters (?v6 - type_5 ?v5 - type_2 ?v7 - type_1)
        :precondition (and (pred_1 ?v7 ?v6) 
                           (pred_1 ?v5 ?v6))
        :effect (and (not (pred_1 ?v5 ?v6))
                     (pred_6 ?v7 ?v5)))

(:action op_1 
        :parameters (?v6 - type_5 ?v5 - type_2 ?v7 - type_1 ?v8 - type_4)
        :precondition (and (pred_1 ?v7 ?v6) 
		      	   (pred_1 ?v8 ?v6)
			   (pred_6 ?v7 ?v5)
			   (pred_5 ?v5)
			   (pred_2 ?v8))
        :effect (and (not (pred_2 ?v8))(not (pred_5 ?v5)) (pred_4 ?v8)))
)