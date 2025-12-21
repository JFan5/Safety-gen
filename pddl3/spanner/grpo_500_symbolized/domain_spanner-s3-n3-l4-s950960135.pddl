(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_2 type_1 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v3 - type_4 ?v7 - type_3)
	(pred_2 ?v3 - type_2 ?v1 - type_5)
	(pred_5 ?v1 - type_5)
	(pred_4 ?v4 - type_3 ?v5 - type_3)
	(pred_3 ?v6 - type_1)
	(pred_6 ?v6 - type_1))                                                                                           
(:action op_2 
        :parameters (?v8 - type_3 ?v2 - type_3 ?v3 - type_2)
        :precondition (and (pred_1 ?v3 ?v8) 
                           (pred_4 ?v8 ?v2))                                                          
        :effect (and (not (pred_1 ?v3 ?v8)) (pred_1 ?v3 ?v2)))

(:action op_3 
        :parameters (?v7 - type_3 ?v1 - type_5 ?v3 - type_2)
        :precondition (and (pred_1 ?v3 ?v7) 
                           (pred_1 ?v1 ?v7))
        :effect (and (not (pred_1 ?v1 ?v7))
                     (pred_2 ?v3 ?v1)))

(:action op_1 
        :parameters (?v7 - type_3 ?v1 - type_5 ?v3 - type_2 ?v6 - type_1)
        :precondition (and (pred_1 ?v3 ?v7) 
		      	   (pred_1 ?v6 ?v7)
			   (pred_2 ?v3 ?v1)
			   (pred_5 ?v1)
			   (pred_6 ?v6))
        :effect (and (not (pred_6 ?v6))(not (pred_5 ?v1)) (pred_3 ?v6)))
)