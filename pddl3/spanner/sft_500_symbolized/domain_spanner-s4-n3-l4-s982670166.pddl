(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_3 type_4 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v1 - type_1 ?v4 - type_5)
	(pred_1 ?v1 - type_3 ?v5 - type_2)
	(pred_6 ?v5 - type_2)
	(pred_5 ?v6 - type_5 ?v7 - type_5)
	(pred_2 ?v3 - type_4)
	(pred_3 ?v3 - type_4))                                                                                           
(:action op_3 
        :parameters (?v8 - type_5 ?v2 - type_5 ?v1 - type_3)
        :precondition (and (pred_4 ?v1 ?v8) 
                           (pred_5 ?v8 ?v2))                                                          
        :effect (and (not (pred_4 ?v1 ?v8)) (pred_4 ?v1 ?v2)))

(:action op_1 
        :parameters (?v4 - type_5 ?v5 - type_2 ?v1 - type_3)
        :precondition (and (pred_4 ?v1 ?v4) 
                           (pred_4 ?v5 ?v4))
        :effect (and (not (pred_4 ?v5 ?v4))
                     (pred_1 ?v1 ?v5)))

(:action op_2 
        :parameters (?v4 - type_5 ?v5 - type_2 ?v1 - type_3 ?v3 - type_4)
        :precondition (and (pred_4 ?v1 ?v4) 
		      	   (pred_4 ?v3 ?v4)
			   (pred_1 ?v1 ?v5)
			   (pred_6 ?v5)
			   (pred_3 ?v3))
        :effect (and (not (pred_3 ?v3))(not (pred_6 ?v5)) (pred_2 ?v3)))
)