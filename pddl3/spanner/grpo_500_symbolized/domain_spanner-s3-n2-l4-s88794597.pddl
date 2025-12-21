(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_2 type_3 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v2 - type_5 ?v7 - type_1)
	(pred_4 ?v2 - type_2 ?v4 - type_4)
	(pred_1 ?v4 - type_4)
	(pred_2 ?v5 - type_1 ?v1 - type_1)
	(pred_3 ?v6 - type_3)
	(pred_5 ?v6 - type_3))                                                                                           
(:action op_1 
        :parameters (?v8 - type_1 ?v3 - type_1 ?v2 - type_2)
        :precondition (and (pred_6 ?v2 ?v8) 
                           (pred_2 ?v8 ?v3))                                                          
        :effect (and (not (pred_6 ?v2 ?v8)) (pred_6 ?v2 ?v3)))

(:action op_2 
        :parameters (?v7 - type_1 ?v4 - type_4 ?v2 - type_2)
        :precondition (and (pred_6 ?v2 ?v7) 
                           (pred_6 ?v4 ?v7))
        :effect (and (not (pred_6 ?v4 ?v7))
                     (pred_4 ?v2 ?v4)))

(:action op_3 
        :parameters (?v7 - type_1 ?v4 - type_4 ?v2 - type_2 ?v6 - type_3)
        :precondition (and (pred_6 ?v2 ?v7) 
		      	   (pred_6 ?v6 ?v7)
			   (pred_4 ?v2 ?v4)
			   (pred_1 ?v4)
			   (pred_5 ?v6))
        :effect (and (not (pred_5 ?v6))(not (pred_1 ?v4)) (pred_3 ?v6)))
)