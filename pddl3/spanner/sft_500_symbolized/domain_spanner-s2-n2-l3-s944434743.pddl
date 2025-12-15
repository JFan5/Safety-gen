(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_1 type_4 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_5 ?v2 - type_3)
	(pred_4 ?v3 - type_1 ?v1 - type_2)
	(pred_6 ?v1 - type_2)
	(pred_1 ?v5 - type_3 ?v4 - type_3)
	(pred_3 ?v6 - type_4)
	(pred_5 ?v6 - type_4))                                                                                           
(:action op_2 
        :parameters (?v7 - type_3 ?v8 - type_3 ?v3 - type_1)
        :precondition (and (pred_2 ?v3 ?v7) 
                           (pred_1 ?v7 ?v8))                                                          
        :effect (and (not (pred_2 ?v3 ?v7)) (pred_2 ?v3 ?v8)))

(:action op_1 
        :parameters (?v2 - type_3 ?v1 - type_2 ?v3 - type_1)
        :precondition (and (pred_2 ?v3 ?v2) 
                           (pred_2 ?v1 ?v2))
        :effect (and (not (pred_2 ?v1 ?v2))
                     (pred_4 ?v3 ?v1)))

(:action op_3 
        :parameters (?v2 - type_3 ?v1 - type_2 ?v3 - type_1 ?v6 - type_4)
        :precondition (and (pred_2 ?v3 ?v2) 
		      	   (pred_2 ?v6 ?v2)
			   (pred_4 ?v3 ?v1)
			   (pred_6 ?v1)
			   (pred_5 ?v6))
        :effect (and (not (pred_5 ?v6))(not (pred_6 ?v1)) (pred_3 ?v6)))
)