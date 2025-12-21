(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_4 type_2 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v1 - type_1 ?v2 - type_5)
	(pred_3 ?v1 - type_4 ?v3 - type_3)
	(pred_5 ?v3 - type_3)
	(pred_4 ?v7 - type_5 ?v6 - type_5)
	(pred_2 ?v8 - type_2)
	(pred_1 ?v8 - type_2))                                                                                           
(:action op_1 
        :parameters (?v5 - type_5 ?v4 - type_5 ?v1 - type_4)
        :precondition (and (pred_6 ?v1 ?v5) 
                           (pred_4 ?v5 ?v4))                                                          
        :effect (and (not (pred_6 ?v1 ?v5)) (pred_6 ?v1 ?v4)))

(:action op_2 
        :parameters (?v2 - type_5 ?v3 - type_3 ?v1 - type_4)
        :precondition (and (pred_6 ?v1 ?v2) 
                           (pred_6 ?v3 ?v2))
        :effect (and (not (pred_6 ?v3 ?v2))
                     (pred_3 ?v1 ?v3)))

(:action op_3 
        :parameters (?v2 - type_5 ?v3 - type_3 ?v1 - type_4 ?v8 - type_2)
        :precondition (and (pred_6 ?v1 ?v2) 
		      	   (pred_6 ?v8 ?v2)
			   (pred_3 ?v1 ?v3)
			   (pred_5 ?v3)
			   (pred_1 ?v8))
        :effect (and (not (pred_1 ?v8))(not (pred_5 ?v3)) (pred_2 ?v8)))
)