(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_5 type_1 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v8 - type_3 ?v1 - type_4)
	(pred_5 ?v8 - type_5 ?v3 - type_2)
	(pred_3 ?v3 - type_2)
	(pred_1 ?v4 - type_4 ?v5 - type_4)
	(pred_4 ?v7 - type_1)
	(pred_6 ?v7 - type_1))                                                                                           
(:action op_2 
        :parameters (?v2 - type_4 ?v6 - type_4 ?v8 - type_5)
        :precondition (and (pred_2 ?v8 ?v2) 
                           (pred_1 ?v2 ?v6))                                                          
        :effect (and (not (pred_2 ?v8 ?v2)) (pred_2 ?v8 ?v6)))

(:action op_1 
        :parameters (?v1 - type_4 ?v3 - type_2 ?v8 - type_5)
        :precondition (and (pred_2 ?v8 ?v1) 
                           (pred_2 ?v3 ?v1))
        :effect (and (not (pred_2 ?v3 ?v1))
                     (pred_5 ?v8 ?v3)))

(:action op_3 
        :parameters (?v1 - type_4 ?v3 - type_2 ?v8 - type_5 ?v7 - type_1)
        :precondition (and (pred_2 ?v8 ?v1) 
		      	   (pred_2 ?v7 ?v1)
			   (pred_5 ?v8 ?v3)
			   (pred_3 ?v3)
			   (pred_6 ?v7))
        :effect (and (not (pred_6 ?v7))(not (pred_3 ?v3)) (pred_4 ?v7)))
)