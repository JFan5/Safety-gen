(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_4 type_2 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_3 ?v6 - type_1)
	(pred_6 ?v7 - type_4 ?v3 - type_5)
	(pred_5 ?v3 - type_5)
	(pred_1 ?v4 - type_1 ?v5 - type_1)
	(pred_4 ?v1 - type_2)
	(pred_3 ?v1 - type_2))                                                                                           
(:action op_1 
        :parameters (?v2 - type_1 ?v8 - type_1 ?v7 - type_4)
        :precondition (and (pred_2 ?v7 ?v2) 
                           (pred_1 ?v2 ?v8))                                                          
        :effect (and (not (pred_2 ?v7 ?v2)) (pred_2 ?v7 ?v8)))

(:action op_2 
        :parameters (?v6 - type_1 ?v3 - type_5 ?v7 - type_4)
        :precondition (and (pred_2 ?v7 ?v6) 
                           (pred_2 ?v3 ?v6))
        :effect (and (not (pred_2 ?v3 ?v6))
                     (pred_6 ?v7 ?v3)))

(:action op_3 
        :parameters (?v6 - type_1 ?v3 - type_5 ?v7 - type_4 ?v1 - type_2)
        :precondition (and (pred_2 ?v7 ?v6) 
		      	   (pred_2 ?v1 ?v6)
			   (pred_6 ?v7 ?v3)
			   (pred_5 ?v3)
			   (pred_3 ?v1))
        :effect (and (not (pred_3 ?v1))(not (pred_5 ?v3)) (pred_4 ?v1)))
)