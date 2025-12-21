(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_5 type_2 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v4 - type_1 ?v6 - type_4)
	(pred_2 ?v4 - type_5 ?v2 - type_3)
	(pred_1 ?v2 - type_3)
	(pred_4 ?v3 - type_4 ?v7 - type_4)
	(pred_5 ?v5 - type_2)
	(pred_3 ?v5 - type_2))                                                                                           
(:action op_3 
        :parameters (?v1 - type_4 ?v8 - type_4 ?v4 - type_5)
        :precondition (and (pred_6 ?v4 ?v1) 
                           (pred_4 ?v1 ?v8))                                                          
        :effect (and (not (pred_6 ?v4 ?v1)) (pred_6 ?v4 ?v8)))

(:action op_2 
        :parameters (?v6 - type_4 ?v2 - type_3 ?v4 - type_5)
        :precondition (and (pred_6 ?v4 ?v6) 
                           (pred_6 ?v2 ?v6))
        :effect (and (not (pred_6 ?v2 ?v6))
                     (pred_2 ?v4 ?v2)))

(:action op_1 
        :parameters (?v6 - type_4 ?v2 - type_3 ?v4 - type_5 ?v5 - type_2)
        :precondition (and (pred_6 ?v4 ?v6) 
		      	   (pred_6 ?v5 ?v6)
			   (pred_2 ?v4 ?v2)
			   (pred_1 ?v2)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_1 ?v2)) (pred_5 ?v5)))
)