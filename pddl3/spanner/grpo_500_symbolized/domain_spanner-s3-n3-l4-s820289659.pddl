(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_3 type_5 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_1 ?v3 - type_2)
	(pred_1 ?v6 - type_3 ?v1 - type_4)
	(pred_3 ?v1 - type_4)
	(pred_6 ?v7 - type_2 ?v5 - type_2)
	(pred_2 ?v2 - type_5)
	(pred_4 ?v2 - type_5))                                                                                           
(:action op_1 
        :parameters (?v4 - type_2 ?v8 - type_2 ?v6 - type_3)
        :precondition (and (pred_5 ?v6 ?v4) 
                           (pred_6 ?v4 ?v8))                                                          
        :effect (and (not (pred_5 ?v6 ?v4)) (pred_5 ?v6 ?v8)))

(:action op_2 
        :parameters (?v3 - type_2 ?v1 - type_4 ?v6 - type_3)
        :precondition (and (pred_5 ?v6 ?v3) 
                           (pred_5 ?v1 ?v3))
        :effect (and (not (pred_5 ?v1 ?v3))
                     (pred_1 ?v6 ?v1)))

(:action op_3 
        :parameters (?v3 - type_2 ?v1 - type_4 ?v6 - type_3 ?v2 - type_5)
        :precondition (and (pred_5 ?v6 ?v3) 
		      	   (pred_5 ?v2 ?v3)
			   (pred_1 ?v6 ?v1)
			   (pred_3 ?v1)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_3 ?v1)) (pred_2 ?v2)))
)