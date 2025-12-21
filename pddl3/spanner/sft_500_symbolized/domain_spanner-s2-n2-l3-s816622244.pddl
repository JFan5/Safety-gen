(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_2 type_5 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_4 ?v1 - type_3)
	(pred_3 ?v4 - type_2 ?v6 - type_1)
	(pred_1 ?v6 - type_1)
	(pred_4 ?v7 - type_3 ?v8 - type_3)
	(pred_6 ?v2 - type_5)
	(pred_5 ?v2 - type_5))                                                                                           
(:action op_1 
        :parameters (?v3 - type_3 ?v5 - type_3 ?v4 - type_2)
        :precondition (and (pred_2 ?v4 ?v3) 
                           (pred_4 ?v3 ?v5))                                                          
        :effect (and (not (pred_2 ?v4 ?v3)) (pred_2 ?v4 ?v5)))

(:action op_3 
        :parameters (?v1 - type_3 ?v6 - type_1 ?v4 - type_2)
        :precondition (and (pred_2 ?v4 ?v1) 
                           (pred_2 ?v6 ?v1))
        :effect (and (not (pred_2 ?v6 ?v1))
                     (pred_3 ?v4 ?v6)))

(:action op_2 
        :parameters (?v1 - type_3 ?v6 - type_1 ?v4 - type_2 ?v2 - type_5)
        :precondition (and (pred_2 ?v4 ?v1) 
		      	   (pred_2 ?v2 ?v1)
			   (pred_3 ?v4 ?v6)
			   (pred_1 ?v6)
			   (pred_5 ?v2))
        :effect (and (not (pred_5 ?v2))(not (pred_1 ?v6)) (pred_6 ?v2)))
)