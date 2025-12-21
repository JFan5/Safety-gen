(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_3 type_4 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v1 - type_1 ?v3 - type_2)
	(pred_2 ?v1 - type_3 ?v8 - type_5)
	(pred_4 ?v8 - type_5)
	(pred_3 ?v5 - type_2 ?v2 - type_2)
	(pred_6 ?v7 - type_4)
	(pred_1 ?v7 - type_4))                                                                                           
(:action op_1 
        :parameters (?v6 - type_2 ?v4 - type_2 ?v1 - type_3)
        :precondition (and (pred_5 ?v1 ?v6) 
                           (pred_3 ?v6 ?v4))                                                          
        :effect (and (not (pred_5 ?v1 ?v6)) (pred_5 ?v1 ?v4)))

(:action op_3 
        :parameters (?v3 - type_2 ?v8 - type_5 ?v1 - type_3)
        :precondition (and (pred_5 ?v1 ?v3) 
                           (pred_5 ?v8 ?v3))
        :effect (and (not (pred_5 ?v8 ?v3))
                     (pred_2 ?v1 ?v8)))

(:action op_2 
        :parameters (?v3 - type_2 ?v8 - type_5 ?v1 - type_3 ?v7 - type_4)
        :precondition (and (pred_5 ?v1 ?v3) 
		      	   (pred_5 ?v7 ?v3)
			   (pred_2 ?v1 ?v8)
			   (pred_4 ?v8)
			   (pred_1 ?v7))
        :effect (and (not (pred_1 ?v7))(not (pred_4 ?v8)) (pred_6 ?v7)))
)