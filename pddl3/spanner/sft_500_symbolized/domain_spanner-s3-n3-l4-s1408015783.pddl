(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_3 type_2 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v8 - type_5 ?v2 - type_1)
	(pred_1 ?v8 - type_3 ?v6 - type_4)
	(pred_2 ?v6 - type_4)
	(pred_3 ?v4 - type_1 ?v5 - type_1)
	(pred_5 ?v7 - type_2)
	(pred_6 ?v7 - type_2))                                                                                           
(:action op_2 
        :parameters (?v1 - type_1 ?v3 - type_1 ?v8 - type_3)
        :precondition (and (pred_4 ?v8 ?v1) 
                           (pred_3 ?v1 ?v3))                                                          
        :effect (and (not (pred_4 ?v8 ?v1)) (pred_4 ?v8 ?v3)))

(:action op_1 
        :parameters (?v2 - type_1 ?v6 - type_4 ?v8 - type_3)
        :precondition (and (pred_4 ?v8 ?v2) 
                           (pred_4 ?v6 ?v2))
        :effect (and (not (pred_4 ?v6 ?v2))
                     (pred_1 ?v8 ?v6)))

(:action op_3 
        :parameters (?v2 - type_1 ?v6 - type_4 ?v8 - type_3 ?v7 - type_2)
        :precondition (and (pred_4 ?v8 ?v2) 
		      	   (pred_4 ?v7 ?v2)
			   (pred_1 ?v8 ?v6)
			   (pred_2 ?v6)
			   (pred_6 ?v7))
        :effect (and (not (pred_6 ?v7))(not (pred_2 ?v6)) (pred_5 ?v7)))
)