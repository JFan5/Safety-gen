(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_4 type_2 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v1 - type_1 ?v3 - type_3)
	(pred_5 ?v1 - type_4 ?v5 - type_5)
	(pred_1 ?v5 - type_5)
	(pred_3 ?v7 - type_3 ?v8 - type_3)
	(pred_4 ?v2 - type_2)
	(pred_6 ?v2 - type_2))                                                                                           
(:action op_1 
        :parameters (?v6 - type_3 ?v4 - type_3 ?v1 - type_4)
        :precondition (and (pred_2 ?v1 ?v6) 
                           (pred_3 ?v6 ?v4))                                                          
        :effect (and (not (pred_2 ?v1 ?v6)) (pred_2 ?v1 ?v4)))

(:action op_3 
        :parameters (?v3 - type_3 ?v5 - type_5 ?v1 - type_4)
        :precondition (and (pred_2 ?v1 ?v3) 
                           (pred_2 ?v5 ?v3))
        :effect (and (not (pred_2 ?v5 ?v3))
                     (pred_5 ?v1 ?v5)))

(:action op_2 
        :parameters (?v3 - type_3 ?v5 - type_5 ?v1 - type_4 ?v2 - type_2)
        :precondition (and (pred_2 ?v1 ?v3) 
		      	   (pred_2 ?v2 ?v3)
			   (pred_5 ?v1 ?v5)
			   (pred_1 ?v5)
			   (pred_6 ?v2))
        :effect (and (not (pred_6 ?v2))(not (pred_1 ?v5)) (pred_4 ?v2)))
)