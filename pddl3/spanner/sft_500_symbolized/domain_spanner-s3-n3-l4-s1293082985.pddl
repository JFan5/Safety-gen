(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_3 type_2 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v6 - type_4 ?v7 - type_5)
	(pred_5 ?v6 - type_3 ?v1 - type_1)
	(pred_6 ?v1 - type_1)
	(pred_4 ?v5 - type_5 ?v4 - type_5)
	(pred_3 ?v3 - type_2)
	(pred_2 ?v3 - type_2))                                                                                           
(:action op_1 
        :parameters (?v2 - type_5 ?v8 - type_5 ?v6 - type_3)
        :precondition (and (pred_1 ?v6 ?v2) 
                           (pred_4 ?v2 ?v8))                                                          
        :effect (and (not (pred_1 ?v6 ?v2)) (pred_1 ?v6 ?v8)))

(:action op_2 
        :parameters (?v7 - type_5 ?v1 - type_1 ?v6 - type_3)
        :precondition (and (pred_1 ?v6 ?v7) 
                           (pred_1 ?v1 ?v7))
        :effect (and (not (pred_1 ?v1 ?v7))
                     (pred_5 ?v6 ?v1)))

(:action op_3 
        :parameters (?v7 - type_5 ?v1 - type_1 ?v6 - type_3 ?v3 - type_2)
        :precondition (and (pred_1 ?v6 ?v7) 
		      	   (pred_1 ?v3 ?v7)
			   (pred_5 ?v6 ?v1)
			   (pred_6 ?v1)
			   (pred_2 ?v3))
        :effect (and (not (pred_2 ?v3))(not (pred_6 ?v1)) (pred_3 ?v3)))
)