(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_4 type_3 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v3 - type_1 ?v6 - type_2)
	(pred_5 ?v3 - type_4 ?v2 - type_5)
	(pred_4 ?v2 - type_5)
	(pred_3 ?v8 - type_2 ?v7 - type_2)
	(pred_2 ?v1 - type_3)
	(pred_1 ?v1 - type_3))                                                                                           
(:action op_2 
        :parameters (?v4 - type_2 ?v5 - type_2 ?v3 - type_4)
        :precondition (and (pred_6 ?v3 ?v4) 
                           (pred_3 ?v4 ?v5))                                                          
        :effect (and (not (pred_6 ?v3 ?v4)) (pred_6 ?v3 ?v5)))

(:action op_3 
        :parameters (?v6 - type_2 ?v2 - type_5 ?v3 - type_4)
        :precondition (and (pred_6 ?v3 ?v6) 
                           (pred_6 ?v2 ?v6))
        :effect (and (not (pred_6 ?v2 ?v6))
                     (pred_5 ?v3 ?v2)))

(:action op_1 
        :parameters (?v6 - type_2 ?v2 - type_5 ?v3 - type_4 ?v1 - type_3)
        :precondition (and (pred_6 ?v3 ?v6) 
		      	   (pred_6 ?v1 ?v6)
			   (pred_5 ?v3 ?v2)
			   (pred_4 ?v2)
			   (pred_1 ?v1))
        :effect (and (not (pred_1 ?v1))(not (pred_4 ?v2)) (pred_2 ?v1)))
)