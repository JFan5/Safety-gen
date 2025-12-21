(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_4 type_2 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_3 ?v1 - type_5)
	(pred_4 ?v7 - type_4 ?v3 - type_1)
	(pred_1 ?v3 - type_1)
	(pred_3 ?v4 - type_5 ?v5 - type_5)
	(pred_6 ?v6 - type_2)
	(pred_5 ?v6 - type_2))                                                                                           
(:action op_1 
        :parameters (?v2 - type_5 ?v8 - type_5 ?v7 - type_4)
        :precondition (and (pred_2 ?v7 ?v2) 
                           (pred_3 ?v2 ?v8))                                                          
        :effect (and (not (pred_2 ?v7 ?v2)) (pred_2 ?v7 ?v8)))

(:action op_2 
        :parameters (?v1 - type_5 ?v3 - type_1 ?v7 - type_4)
        :precondition (and (pred_2 ?v7 ?v1) 
                           (pred_2 ?v3 ?v1))
        :effect (and (not (pred_2 ?v3 ?v1))
                     (pred_4 ?v7 ?v3)))

(:action op_3 
        :parameters (?v1 - type_5 ?v3 - type_1 ?v7 - type_4 ?v6 - type_2)
        :precondition (and (pred_2 ?v7 ?v1) 
		      	   (pred_2 ?v6 ?v1)
			   (pred_4 ?v7 ?v3)
			   (pred_1 ?v3)
			   (pred_5 ?v6))
        :effect (and (not (pred_5 ?v6))(not (pred_1 ?v3)) (pred_6 ?v6)))
)