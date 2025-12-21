(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_1 type_2 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v3 - type_4 ?v7 - type_5)
	(pred_5 ?v3 - type_1 ?v1 - type_3)
	(pred_6 ?v1 - type_3)
	(pred_2 ?v8 - type_5 ?v2 - type_5)
	(pred_1 ?v6 - type_2)
	(pred_3 ?v6 - type_2))                                                                                           
(:action op_1 
        :parameters (?v5 - type_5 ?v4 - type_5 ?v3 - type_1)
        :precondition (and (pred_4 ?v3 ?v5) 
                           (pred_2 ?v5 ?v4))                                                          
        :effect (and (not (pred_4 ?v3 ?v5)) (pred_4 ?v3 ?v4)))

(:action op_3 
        :parameters (?v7 - type_5 ?v1 - type_3 ?v3 - type_1)
        :precondition (and (pred_4 ?v3 ?v7) 
                           (pred_4 ?v1 ?v7))
        :effect (and (not (pred_4 ?v1 ?v7))
                     (pred_5 ?v3 ?v1)))

(:action op_2 
        :parameters (?v7 - type_5 ?v1 - type_3 ?v3 - type_1 ?v6 - type_2)
        :precondition (and (pred_4 ?v3 ?v7) 
		      	   (pred_4 ?v6 ?v7)
			   (pred_5 ?v3 ?v1)
			   (pred_6 ?v1)
			   (pred_3 ?v6))
        :effect (and (not (pred_3 ?v6))(not (pred_6 ?v1)) (pred_1 ?v6)))
)