(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_5 type_3 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_2 ?v1 - type_1)
	(pred_2 ?v6 - type_5 ?v7 - type_4)
	(pred_6 ?v7 - type_4)
	(pred_4 ?v2 - type_1 ?v4 - type_1)
	(pred_1 ?v5 - type_3)
	(pred_3 ?v5 - type_3))                                                                                           
(:action op_3 
        :parameters (?v8 - type_1 ?v3 - type_1 ?v6 - type_5)
        :precondition (and (pred_5 ?v6 ?v8) 
                           (pred_4 ?v8 ?v3))                                                          
        :effect (and (not (pred_5 ?v6 ?v8)) (pred_5 ?v6 ?v3)))

(:action op_1 
        :parameters (?v1 - type_1 ?v7 - type_4 ?v6 - type_5)
        :precondition (and (pred_5 ?v6 ?v1) 
                           (pred_5 ?v7 ?v1))
        :effect (and (not (pred_5 ?v7 ?v1))
                     (pred_2 ?v6 ?v7)))

(:action op_2 
        :parameters (?v1 - type_1 ?v7 - type_4 ?v6 - type_5 ?v5 - type_3)
        :precondition (and (pred_5 ?v6 ?v1) 
		      	   (pred_5 ?v5 ?v1)
			   (pred_2 ?v6 ?v7)
			   (pred_6 ?v7)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_6 ?v7)) (pred_1 ?v5)))
)