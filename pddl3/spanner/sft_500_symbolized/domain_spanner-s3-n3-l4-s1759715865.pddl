(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_1 type_2 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v5 - type_3 ?v4 - type_4)
	(pred_6 ?v5 - type_1 ?v2 - type_5)
	(pred_5 ?v2 - type_5)
	(pred_1 ?v7 - type_4 ?v3 - type_4)
	(pred_4 ?v6 - type_2)
	(pred_2 ?v6 - type_2))                                                                                           
(:action op_3 
        :parameters (?v1 - type_4 ?v8 - type_4 ?v5 - type_1)
        :precondition (and (pred_3 ?v5 ?v1) 
                           (pred_1 ?v1 ?v8))                                                          
        :effect (and (not (pred_3 ?v5 ?v1)) (pred_3 ?v5 ?v8)))

(:action op_1 
        :parameters (?v4 - type_4 ?v2 - type_5 ?v5 - type_1)
        :precondition (and (pred_3 ?v5 ?v4) 
                           (pred_3 ?v2 ?v4))
        :effect (and (not (pred_3 ?v2 ?v4))
                     (pred_6 ?v5 ?v2)))

(:action op_2 
        :parameters (?v4 - type_4 ?v2 - type_5 ?v5 - type_1 ?v6 - type_2)
        :precondition (and (pred_3 ?v5 ?v4) 
		      	   (pred_3 ?v6 ?v4)
			   (pred_6 ?v5 ?v2)
			   (pred_5 ?v2)
			   (pred_2 ?v6))
        :effect (and (not (pred_2 ?v6))(not (pred_5 ?v2)) (pred_4 ?v6)))
)