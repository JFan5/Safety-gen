(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_3 type_4 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v5 - type_2 ?v7 - type_1)
	(pred_6 ?v5 - type_3 ?v3 - type_5)
	(pred_1 ?v3 - type_5)
	(pred_2 ?v2 - type_1 ?v8 - type_1)
	(pred_4 ?v4 - type_4)
	(pred_3 ?v4 - type_4))                                                                                           
(:action op_3 
        :parameters (?v1 - type_1 ?v6 - type_1 ?v5 - type_3)
        :precondition (and (pred_5 ?v5 ?v1) 
                           (pred_2 ?v1 ?v6))                                                          
        :effect (and (not (pred_5 ?v5 ?v1)) (pred_5 ?v5 ?v6)))

(:action op_2 
        :parameters (?v7 - type_1 ?v3 - type_5 ?v5 - type_3)
        :precondition (and (pred_5 ?v5 ?v7) 
                           (pred_5 ?v3 ?v7))
        :effect (and (not (pred_5 ?v3 ?v7))
                     (pred_6 ?v5 ?v3)))

(:action op_1 
        :parameters (?v7 - type_1 ?v3 - type_5 ?v5 - type_3 ?v4 - type_4)
        :precondition (and (pred_5 ?v5 ?v7) 
		      	   (pred_5 ?v4 ?v7)
			   (pred_6 ?v5 ?v3)
			   (pred_1 ?v3)
			   (pred_3 ?v4))
        :effect (and (not (pred_3 ?v4))(not (pred_1 ?v3)) (pred_4 ?v4)))
)