(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_4 type_2 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v2 - type_5 ?v4 - type_3)
	(pred_1 ?v2 - type_4 ?v1 - type_1)
	(pred_6 ?v1 - type_1)
	(pred_3 ?v7 - type_3 ?v8 - type_3)
	(pred_4 ?v6 - type_2)
	(pred_5 ?v6 - type_2))                                                                                           
(:action op_3 
        :parameters (?v3 - type_3 ?v5 - type_3 ?v2 - type_4)
        :precondition (and (pred_2 ?v2 ?v3) 
                           (pred_3 ?v3 ?v5))                                                          
        :effect (and (not (pred_2 ?v2 ?v3)) (pred_2 ?v2 ?v5)))

(:action op_2 
        :parameters (?v4 - type_3 ?v1 - type_1 ?v2 - type_4)
        :precondition (and (pred_2 ?v2 ?v4) 
                           (pred_2 ?v1 ?v4))
        :effect (and (not (pred_2 ?v1 ?v4))
                     (pred_1 ?v2 ?v1)))

(:action op_1 
        :parameters (?v4 - type_3 ?v1 - type_1 ?v2 - type_4 ?v6 - type_2)
        :precondition (and (pred_2 ?v2 ?v4) 
		      	   (pred_2 ?v6 ?v4)
			   (pred_1 ?v2 ?v1)
			   (pred_6 ?v1)
			   (pred_5 ?v6))
        :effect (and (not (pred_5 ?v6))(not (pred_6 ?v1)) (pred_4 ?v6)))
)