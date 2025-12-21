(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_1 type_4 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v6 - type_2 ?v1 - type_3)
	(pred_2 ?v6 - type_1 ?v7 - type_5)
	(pred_3 ?v7 - type_5)
	(pred_5 ?v3 - type_3 ?v8 - type_3)
	(pred_4 ?v5 - type_4)
	(pred_6 ?v5 - type_4))                                                                                           
(:action op_3 
        :parameters (?v2 - type_3 ?v4 - type_3 ?v6 - type_1)
        :precondition (and (pred_1 ?v6 ?v2) 
                           (pred_5 ?v2 ?v4))                                                          
        :effect (and (not (pred_1 ?v6 ?v2)) (pred_1 ?v6 ?v4)))

(:action op_2 
        :parameters (?v1 - type_3 ?v7 - type_5 ?v6 - type_1)
        :precondition (and (pred_1 ?v6 ?v1) 
                           (pred_1 ?v7 ?v1))
        :effect (and (not (pred_1 ?v7 ?v1))
                     (pred_2 ?v6 ?v7)))

(:action op_1 
        :parameters (?v1 - type_3 ?v7 - type_5 ?v6 - type_1 ?v5 - type_4)
        :precondition (and (pred_1 ?v6 ?v1) 
		      	   (pred_1 ?v5 ?v1)
			   (pred_2 ?v6 ?v7)
			   (pred_3 ?v7)
			   (pred_6 ?v5))
        :effect (and (not (pred_6 ?v5))(not (pred_3 ?v7)) (pred_4 ?v5)))
)