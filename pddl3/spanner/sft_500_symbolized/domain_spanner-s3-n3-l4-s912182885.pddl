(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_5 type_4 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v3 - type_3 ?v1 - type_1)
	(pred_6 ?v3 - type_5 ?v4 - type_2)
	(pred_4 ?v4 - type_2)
	(pred_5 ?v7 - type_1 ?v8 - type_1)
	(pred_3 ?v6 - type_4)
	(pred_2 ?v6 - type_4))                                                                                           
(:action op_2 
        :parameters (?v5 - type_1 ?v2 - type_1 ?v3 - type_5)
        :precondition (and (pred_1 ?v3 ?v5) 
                           (pred_5 ?v5 ?v2))                                                          
        :effect (and (not (pred_1 ?v3 ?v5)) (pred_1 ?v3 ?v2)))

(:action op_1 
        :parameters (?v1 - type_1 ?v4 - type_2 ?v3 - type_5)
        :precondition (and (pred_1 ?v3 ?v1) 
                           (pred_1 ?v4 ?v1))
        :effect (and (not (pred_1 ?v4 ?v1))
                     (pred_6 ?v3 ?v4)))

(:action op_3 
        :parameters (?v1 - type_1 ?v4 - type_2 ?v3 - type_5 ?v6 - type_4)
        :precondition (and (pred_1 ?v3 ?v1) 
		      	   (pred_1 ?v6 ?v1)
			   (pred_6 ?v3 ?v4)
			   (pred_4 ?v4)
			   (pred_2 ?v6))
        :effect (and (not (pred_2 ?v6))(not (pred_4 ?v4)) (pred_3 ?v6)))
)