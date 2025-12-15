(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_4 type_2 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v8 - type_1 ?v2 - type_3)
	(pred_3 ?v8 - type_4 ?v3 - type_5)
	(pred_2 ?v3 - type_5)
	(pred_1 ?v6 - type_3 ?v7 - type_3)
	(pred_5 ?v4 - type_2)
	(pred_6 ?v4 - type_2))                                                                                           
(:action op_2 
        :parameters (?v5 - type_3 ?v1 - type_3 ?v8 - type_4)
        :precondition (and (pred_4 ?v8 ?v5) 
                           (pred_1 ?v5 ?v1))                                                          
        :effect (and (not (pred_4 ?v8 ?v5)) (pred_4 ?v8 ?v1)))

(:action op_1 
        :parameters (?v2 - type_3 ?v3 - type_5 ?v8 - type_4)
        :precondition (and (pred_4 ?v8 ?v2) 
                           (pred_4 ?v3 ?v2))
        :effect (and (not (pred_4 ?v3 ?v2))
                     (pred_3 ?v8 ?v3)))

(:action op_3 
        :parameters (?v2 - type_3 ?v3 - type_5 ?v8 - type_4 ?v4 - type_2)
        :precondition (and (pred_4 ?v8 ?v2) 
		      	   (pred_4 ?v4 ?v2)
			   (pred_3 ?v8 ?v3)
			   (pred_2 ?v3)
			   (pred_6 ?v4))
        :effect (and (not (pred_6 ?v4))(not (pred_2 ?v3)) (pred_5 ?v4)))
)