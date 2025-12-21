(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_3 type_4 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v6 - type_5 ?v5 - type_2)
	(pred_4 ?v6 - type_3 ?v4 - type_1)
	(pred_6 ?v4 - type_1)
	(pred_1 ?v2 - type_2 ?v3 - type_2)
	(pred_3 ?v1 - type_4)
	(pred_5 ?v1 - type_4))                                                                                           
(:action op_3 
        :parameters (?v8 - type_2 ?v7 - type_2 ?v6 - type_3)
        :precondition (and (pred_2 ?v6 ?v8) 
                           (pred_1 ?v8 ?v7))                                                          
        :effect (and (not (pred_2 ?v6 ?v8)) (pred_2 ?v6 ?v7)))

(:action op_2 
        :parameters (?v5 - type_2 ?v4 - type_1 ?v6 - type_3)
        :precondition (and (pred_2 ?v6 ?v5) 
                           (pred_2 ?v4 ?v5))
        :effect (and (not (pred_2 ?v4 ?v5))
                     (pred_4 ?v6 ?v4)))

(:action op_1 
        :parameters (?v5 - type_2 ?v4 - type_1 ?v6 - type_3 ?v1 - type_4)
        :precondition (and (pred_2 ?v6 ?v5) 
		      	   (pred_2 ?v1 ?v5)
			   (pred_4 ?v6 ?v4)
			   (pred_6 ?v4)
			   (pred_5 ?v1))
        :effect (and (not (pred_5 ?v1))(not (pred_6 ?v4)) (pred_3 ?v1)))
)