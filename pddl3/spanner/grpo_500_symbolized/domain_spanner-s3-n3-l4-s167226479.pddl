(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_3 type_1 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_2 ?v1 - type_4)
	(pred_6 ?v7 - type_3 ?v3 - type_5)
	(pred_1 ?v3 - type_5)
	(pred_4 ?v5 - type_4 ?v4 - type_4)
	(pred_5 ?v6 - type_1)
	(pred_3 ?v6 - type_1))                                                                                           
(:action op_2 
        :parameters (?v8 - type_4 ?v2 - type_4 ?v7 - type_3)
        :precondition (and (pred_2 ?v7 ?v8) 
                           (pred_4 ?v8 ?v2))                                                          
        :effect (and (not (pred_2 ?v7 ?v8)) (pred_2 ?v7 ?v2)))

(:action op_3 
        :parameters (?v1 - type_4 ?v3 - type_5 ?v7 - type_3)
        :precondition (and (pred_2 ?v7 ?v1) 
                           (pred_2 ?v3 ?v1))
        :effect (and (not (pred_2 ?v3 ?v1))
                     (pred_6 ?v7 ?v3)))

(:action op_1 
        :parameters (?v1 - type_4 ?v3 - type_5 ?v7 - type_3 ?v6 - type_1)
        :precondition (and (pred_2 ?v7 ?v1) 
		      	   (pred_2 ?v6 ?v1)
			   (pred_6 ?v7 ?v3)
			   (pred_1 ?v3)
			   (pred_3 ?v6))
        :effect (and (not (pred_3 ?v6))(not (pred_1 ?v3)) (pred_5 ?v6)))
)