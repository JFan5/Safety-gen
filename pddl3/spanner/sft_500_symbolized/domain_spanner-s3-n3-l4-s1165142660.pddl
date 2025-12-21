(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_4 type_3 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v6 - type_2 ?v1 - type_5)
	(pred_1 ?v6 - type_4 ?v7 - type_1)
	(pred_4 ?v7 - type_1)
	(pred_5 ?v5 - type_5 ?v3 - type_5)
	(pred_3 ?v4 - type_3)
	(pred_2 ?v4 - type_3))                                                                                           
(:action op_1 
        :parameters (?v2 - type_5 ?v8 - type_5 ?v6 - type_4)
        :precondition (and (pred_6 ?v6 ?v2) 
                           (pred_5 ?v2 ?v8))                                                          
        :effect (and (not (pred_6 ?v6 ?v2)) (pred_6 ?v6 ?v8)))

(:action op_3 
        :parameters (?v1 - type_5 ?v7 - type_1 ?v6 - type_4)
        :precondition (and (pred_6 ?v6 ?v1) 
                           (pred_6 ?v7 ?v1))
        :effect (and (not (pred_6 ?v7 ?v1))
                     (pred_1 ?v6 ?v7)))

(:action op_2 
        :parameters (?v1 - type_5 ?v7 - type_1 ?v6 - type_4 ?v4 - type_3)
        :precondition (and (pred_6 ?v6 ?v1) 
		      	   (pred_6 ?v4 ?v1)
			   (pred_1 ?v6 ?v7)
			   (pred_4 ?v7)
			   (pred_2 ?v4))
        :effect (and (not (pred_2 ?v4))(not (pred_4 ?v7)) (pred_3 ?v4)))
)