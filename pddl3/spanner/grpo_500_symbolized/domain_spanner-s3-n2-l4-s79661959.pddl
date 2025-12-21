(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_4 type_2 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v2 - type_5 ?v4 - type_3)
	(pred_1 ?v2 - type_4 ?v1 - type_1)
	(pred_2 ?v1 - type_1)
	(pred_3 ?v7 - type_3 ?v3 - type_3)
	(pred_6 ?v5 - type_2)
	(pred_4 ?v5 - type_2))                                                                                           
(:action op_2 
        :parameters (?v8 - type_3 ?v6 - type_3 ?v2 - type_4)
        :precondition (and (pred_5 ?v2 ?v8) 
                           (pred_3 ?v8 ?v6))                                                          
        :effect (and (not (pred_5 ?v2 ?v8)) (pred_5 ?v2 ?v6)))

(:action op_3 
        :parameters (?v4 - type_3 ?v1 - type_1 ?v2 - type_4)
        :precondition (and (pred_5 ?v2 ?v4) 
                           (pred_5 ?v1 ?v4))
        :effect (and (not (pred_5 ?v1 ?v4))
                     (pred_1 ?v2 ?v1)))

(:action op_1 
        :parameters (?v4 - type_3 ?v1 - type_1 ?v2 - type_4 ?v5 - type_2)
        :precondition (and (pred_5 ?v2 ?v4) 
		      	   (pred_5 ?v5 ?v4)
			   (pred_1 ?v2 ?v1)
			   (pred_2 ?v1)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_2 ?v1)) (pred_6 ?v5)))
)