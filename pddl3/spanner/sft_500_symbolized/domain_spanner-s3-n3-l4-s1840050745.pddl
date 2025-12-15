(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_3 type_1 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_2 ?v6 - type_4)
	(pred_5 ?v1 - type_3 ?v3 - type_5)
	(pred_2 ?v3 - type_5)
	(pred_4 ?v7 - type_4 ?v8 - type_4)
	(pred_1 ?v5 - type_1)
	(pred_6 ?v5 - type_1))                                                                                           
(:action op_1 
        :parameters (?v4 - type_4 ?v2 - type_4 ?v1 - type_3)
        :precondition (and (pred_3 ?v1 ?v4) 
                           (pred_4 ?v4 ?v2))                                                          
        :effect (and (not (pred_3 ?v1 ?v4)) (pred_3 ?v1 ?v2)))

(:action op_3 
        :parameters (?v6 - type_4 ?v3 - type_5 ?v1 - type_3)
        :precondition (and (pred_3 ?v1 ?v6) 
                           (pred_3 ?v3 ?v6))
        :effect (and (not (pred_3 ?v3 ?v6))
                     (pred_5 ?v1 ?v3)))

(:action op_2 
        :parameters (?v6 - type_4 ?v3 - type_5 ?v1 - type_3 ?v5 - type_1)
        :precondition (and (pred_3 ?v1 ?v6) 
		      	   (pred_3 ?v5 ?v6)
			   (pred_5 ?v1 ?v3)
			   (pred_2 ?v3)
			   (pred_6 ?v5))
        :effect (and (not (pred_6 ?v5))(not (pred_2 ?v3)) (pred_1 ?v5)))
)