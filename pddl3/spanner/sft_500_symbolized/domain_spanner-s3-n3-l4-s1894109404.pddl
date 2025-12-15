(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_2 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_3 ?v1 - type_1)
	(pred_2 ?v6 - type_2 ?v3 - type_4)
	(pred_3 ?v3 - type_4)
	(pred_1 ?v8 - type_1 ?v7 - type_1)
	(pred_6 ?v4 - type_5)
	(pred_4 ?v4 - type_5))                                                                                           
(:action op_2 
        :parameters (?v5 - type_1 ?v2 - type_1 ?v6 - type_2)
        :precondition (and (pred_5 ?v6 ?v5) 
                           (pred_1 ?v5 ?v2))                                                          
        :effect (and (not (pred_5 ?v6 ?v5)) (pred_5 ?v6 ?v2)))

(:action op_3 
        :parameters (?v1 - type_1 ?v3 - type_4 ?v6 - type_2)
        :precondition (and (pred_5 ?v6 ?v1) 
                           (pred_5 ?v3 ?v1))
        :effect (and (not (pred_5 ?v3 ?v1))
                     (pred_2 ?v6 ?v3)))

(:action op_1 
        :parameters (?v1 - type_1 ?v3 - type_4 ?v6 - type_2 ?v4 - type_5)
        :precondition (and (pred_5 ?v6 ?v1) 
		      	   (pred_5 ?v4 ?v1)
			   (pred_2 ?v6 ?v3)
			   (pred_3 ?v3)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_3 ?v3)) (pred_6 ?v4)))
)