(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_4 type_3 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_1 ?v2 - type_5)
	(pred_2 ?v8 - type_4 ?v3 - type_2)
	(pred_6 ?v3 - type_2)
	(pred_3 ?v5 - type_5 ?v4 - type_5)
	(pred_1 ?v6 - type_3)
	(pred_4 ?v6 - type_3))                                                                                           
(:action op_1 
        :parameters (?v1 - type_5 ?v7 - type_5 ?v8 - type_4)
        :precondition (and (pred_5 ?v8 ?v1) 
                           (pred_3 ?v1 ?v7))                                                          
        :effect (and (not (pred_5 ?v8 ?v1)) (pred_5 ?v8 ?v7)))

(:action op_3 
        :parameters (?v2 - type_5 ?v3 - type_2 ?v8 - type_4)
        :precondition (and (pred_5 ?v8 ?v2) 
                           (pred_5 ?v3 ?v2))
        :effect (and (not (pred_5 ?v3 ?v2))
                     (pred_2 ?v8 ?v3)))

(:action op_2 
        :parameters (?v2 - type_5 ?v3 - type_2 ?v8 - type_4 ?v6 - type_3)
        :precondition (and (pred_5 ?v8 ?v2) 
		      	   (pred_5 ?v6 ?v2)
			   (pred_2 ?v8 ?v3)
			   (pred_6 ?v3)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_6 ?v3)) (pred_1 ?v6)))
)