(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_3 type_4 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_2 ?v6 - type_1)
	(pred_4 ?v7 - type_3 ?v1 - type_5)
	(pred_6 ?v1 - type_5)
	(pred_1 ?v3 - type_1 ?v2 - type_1)
	(pred_5 ?v4 - type_4)
	(pred_3 ?v4 - type_4))                                                                                           
(:action op_1 
        :parameters (?v8 - type_1 ?v5 - type_1 ?v7 - type_3)
        :precondition (and (pred_2 ?v7 ?v8) 
                           (pred_1 ?v8 ?v5))                                                          
        :effect (and (not (pred_2 ?v7 ?v8)) (pred_2 ?v7 ?v5)))

(:action op_2 
        :parameters (?v6 - type_1 ?v1 - type_5 ?v7 - type_3)
        :precondition (and (pred_2 ?v7 ?v6) 
                           (pred_2 ?v1 ?v6))
        :effect (and (not (pred_2 ?v1 ?v6))
                     (pred_4 ?v7 ?v1)))

(:action op_3 
        :parameters (?v6 - type_1 ?v1 - type_5 ?v7 - type_3 ?v4 - type_4)
        :precondition (and (pred_2 ?v7 ?v6) 
		      	   (pred_2 ?v4 ?v6)
			   (pred_4 ?v7 ?v1)
			   (pred_6 ?v1)
			   (pred_3 ?v4))
        :effect (and (not (pred_3 ?v4))(not (pred_6 ?v1)) (pred_5 ?v4)))
)