(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_5 type_2 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v4 - type_3 ?v8 - type_1)
	(pred_6 ?v4 - type_5 ?v1 - type_4)
	(pred_1 ?v1 - type_4)
	(pred_2 ?v2 - type_1 ?v3 - type_1)
	(pred_4 ?v6 - type_2)
	(pred_5 ?v6 - type_2))                                                                                           
(:action op_1 
        :parameters (?v7 - type_1 ?v5 - type_1 ?v4 - type_5)
        :precondition (and (pred_3 ?v4 ?v7) 
                           (pred_2 ?v7 ?v5))                                                          
        :effect (and (not (pred_3 ?v4 ?v7)) (pred_3 ?v4 ?v5)))

(:action op_3 
        :parameters (?v8 - type_1 ?v1 - type_4 ?v4 - type_5)
        :precondition (and (pred_3 ?v4 ?v8) 
                           (pred_3 ?v1 ?v8))
        :effect (and (not (pred_3 ?v1 ?v8))
                     (pred_6 ?v4 ?v1)))

(:action op_2 
        :parameters (?v8 - type_1 ?v1 - type_4 ?v4 - type_5 ?v6 - type_2)
        :precondition (and (pred_3 ?v4 ?v8) 
		      	   (pred_3 ?v6 ?v8)
			   (pred_6 ?v4 ?v1)
			   (pred_1 ?v1)
			   (pred_5 ?v6))
        :effect (and (not (pred_5 ?v6))(not (pred_1 ?v1)) (pred_4 ?v6)))
)