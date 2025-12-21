(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_3 type_2 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v8 - type_5 ?v1 - type_4)
	(pred_4 ?v8 - type_3 ?v7 - type_1)
	(pred_2 ?v7 - type_1)
	(pred_6 ?v2 - type_4 ?v5 - type_4)
	(pred_5 ?v6 - type_2)
	(pred_1 ?v6 - type_2))                                                                                           
(:action op_2 
        :parameters (?v3 - type_4 ?v4 - type_4 ?v8 - type_3)
        :precondition (and (pred_3 ?v8 ?v3) 
                           (pred_6 ?v3 ?v4))                                                          
        :effect (and (not (pred_3 ?v8 ?v3)) (pred_3 ?v8 ?v4)))

(:action op_3 
        :parameters (?v1 - type_4 ?v7 - type_1 ?v8 - type_3)
        :precondition (and (pred_3 ?v8 ?v1) 
                           (pred_3 ?v7 ?v1))
        :effect (and (not (pred_3 ?v7 ?v1))
                     (pred_4 ?v8 ?v7)))

(:action op_1 
        :parameters (?v1 - type_4 ?v7 - type_1 ?v8 - type_3 ?v6 - type_2)
        :precondition (and (pred_3 ?v8 ?v1) 
		      	   (pred_3 ?v6 ?v1)
			   (pred_4 ?v8 ?v7)
			   (pred_2 ?v7)
			   (pred_1 ?v6))
        :effect (and (not (pred_1 ?v6))(not (pred_2 ?v7)) (pred_5 ?v6)))
)