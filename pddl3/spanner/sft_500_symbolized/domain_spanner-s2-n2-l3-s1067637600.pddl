(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_1 type_2 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v6 - type_4 ?v1 - type_5)
	(pred_4 ?v6 - type_1 ?v3 - type_3)
	(pred_5 ?v3 - type_3)
	(pred_3 ?v7 - type_5 ?v4 - type_5)
	(pred_2 ?v5 - type_2)
	(pred_6 ?v5 - type_2))                                                                                           
(:action op_3 
        :parameters (?v8 - type_5 ?v2 - type_5 ?v6 - type_1)
        :precondition (and (pred_1 ?v6 ?v8) 
                           (pred_3 ?v8 ?v2))                                                          
        :effect (and (not (pred_1 ?v6 ?v8)) (pred_1 ?v6 ?v2)))

(:action op_1 
        :parameters (?v1 - type_5 ?v3 - type_3 ?v6 - type_1)
        :precondition (and (pred_1 ?v6 ?v1) 
                           (pred_1 ?v3 ?v1))
        :effect (and (not (pred_1 ?v3 ?v1))
                     (pred_4 ?v6 ?v3)))

(:action op_2 
        :parameters (?v1 - type_5 ?v3 - type_3 ?v6 - type_1 ?v5 - type_2)
        :precondition (and (pred_1 ?v6 ?v1) 
		      	   (pred_1 ?v5 ?v1)
			   (pred_4 ?v6 ?v3)
			   (pred_5 ?v3)
			   (pred_6 ?v5))
        :effect (and (not (pred_6 ?v5))(not (pred_5 ?v3)) (pred_2 ?v5)))
)