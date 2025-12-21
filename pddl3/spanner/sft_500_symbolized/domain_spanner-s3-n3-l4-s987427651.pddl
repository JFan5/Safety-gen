(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_5 type_4 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v7 - type_2 ?v2 - type_3)
	(pred_4 ?v7 - type_5 ?v8 - type_1)
	(pred_3 ?v8 - type_1)
	(pred_2 ?v5 - type_3 ?v3 - type_3)
	(pred_6 ?v6 - type_4)
	(pred_1 ?v6 - type_4))                                                                                           
(:action op_1 
        :parameters (?v1 - type_3 ?v4 - type_3 ?v7 - type_5)
        :precondition (and (pred_5 ?v7 ?v1) 
                           (pred_2 ?v1 ?v4))                                                          
        :effect (and (not (pred_5 ?v7 ?v1)) (pred_5 ?v7 ?v4)))

(:action op_2 
        :parameters (?v2 - type_3 ?v8 - type_1 ?v7 - type_5)
        :precondition (and (pred_5 ?v7 ?v2) 
                           (pred_5 ?v8 ?v2))
        :effect (and (not (pred_5 ?v8 ?v2))
                     (pred_4 ?v7 ?v8)))

(:action op_3 
        :parameters (?v2 - type_3 ?v8 - type_1 ?v7 - type_5 ?v6 - type_4)
        :precondition (and (pred_5 ?v7 ?v2) 
		      	   (pred_5 ?v6 ?v2)
			   (pred_4 ?v7 ?v8)
			   (pred_3 ?v8)
			   (pred_1 ?v6))
        :effect (and (not (pred_1 ?v6))(not (pred_3 ?v8)) (pred_6 ?v6)))
)