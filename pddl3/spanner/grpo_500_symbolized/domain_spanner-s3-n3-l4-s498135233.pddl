(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_2 type_3 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v2 - type_4 ?v1 - type_1)
	(pred_3 ?v2 - type_2 ?v6 - type_5)
	(pred_6 ?v6 - type_5)
	(pred_2 ?v5 - type_1 ?v3 - type_1)
	(pred_4 ?v8 - type_3)
	(pred_1 ?v8 - type_3))                                                                                           
(:action op_3 
        :parameters (?v7 - type_1 ?v4 - type_1 ?v2 - type_2)
        :precondition (and (pred_5 ?v2 ?v7) 
                           (pred_2 ?v7 ?v4))                                                          
        :effect (and (not (pred_5 ?v2 ?v7)) (pred_5 ?v2 ?v4)))

(:action op_2 
        :parameters (?v1 - type_1 ?v6 - type_5 ?v2 - type_2)
        :precondition (and (pred_5 ?v2 ?v1) 
                           (pred_5 ?v6 ?v1))
        :effect (and (not (pred_5 ?v6 ?v1))
                     (pred_3 ?v2 ?v6)))

(:action op_1 
        :parameters (?v1 - type_1 ?v6 - type_5 ?v2 - type_2 ?v8 - type_3)
        :precondition (and (pred_5 ?v2 ?v1) 
		      	   (pred_5 ?v8 ?v1)
			   (pred_3 ?v2 ?v6)
			   (pred_6 ?v6)
			   (pred_1 ?v8))
        :effect (and (not (pred_1 ?v8))(not (pred_6 ?v6)) (pred_4 ?v8)))
)