(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_2 type_5 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v6 - type_4 ?v3 - type_1)
	(pred_4 ?v6 - type_2 ?v1 - type_3)
	(pred_5 ?v1 - type_3)
	(pred_1 ?v7 - type_1 ?v4 - type_1)
	(pred_6 ?v2 - type_5)
	(pred_3 ?v2 - type_5))                                                                                           
(:action op_3 
        :parameters (?v8 - type_1 ?v5 - type_1 ?v6 - type_2)
        :precondition (and (pred_2 ?v6 ?v8) 
                           (pred_1 ?v8 ?v5))                                                          
        :effect (and (not (pred_2 ?v6 ?v8)) (pred_2 ?v6 ?v5)))

(:action op_1 
        :parameters (?v3 - type_1 ?v1 - type_3 ?v6 - type_2)
        :precondition (and (pred_2 ?v6 ?v3) 
                           (pred_2 ?v1 ?v3))
        :effect (and (not (pred_2 ?v1 ?v3))
                     (pred_4 ?v6 ?v1)))

(:action op_2 
        :parameters (?v3 - type_1 ?v1 - type_3 ?v6 - type_2 ?v2 - type_5)
        :precondition (and (pred_2 ?v6 ?v3) 
		      	   (pred_2 ?v2 ?v3)
			   (pred_4 ?v6 ?v1)
			   (pred_5 ?v1)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_5 ?v1)) (pred_6 ?v2)))
)