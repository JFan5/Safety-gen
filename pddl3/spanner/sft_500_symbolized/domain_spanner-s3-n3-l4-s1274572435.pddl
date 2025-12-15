(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_5 type_4 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v8 - type_1 ?v1 - type_2)
	(pred_1 ?v8 - type_5 ?v3 - type_3)
	(pred_5 ?v3 - type_3)
	(pred_3 ?v5 - type_2 ?v4 - type_2)
	(pred_2 ?v7 - type_4)
	(pred_6 ?v7 - type_4))                                                                                           
(:action op_3 
        :parameters (?v6 - type_2 ?v2 - type_2 ?v8 - type_5)
        :precondition (and (pred_4 ?v8 ?v6) 
                           (pred_3 ?v6 ?v2))                                                          
        :effect (and (not (pred_4 ?v8 ?v6)) (pred_4 ?v8 ?v2)))

(:action op_1 
        :parameters (?v1 - type_2 ?v3 - type_3 ?v8 - type_5)
        :precondition (and (pred_4 ?v8 ?v1) 
                           (pred_4 ?v3 ?v1))
        :effect (and (not (pred_4 ?v3 ?v1))
                     (pred_1 ?v8 ?v3)))

(:action op_2 
        :parameters (?v1 - type_2 ?v3 - type_3 ?v8 - type_5 ?v7 - type_4)
        :precondition (and (pred_4 ?v8 ?v1) 
		      	   (pred_4 ?v7 ?v1)
			   (pred_1 ?v8 ?v3)
			   (pred_5 ?v3)
			   (pred_6 ?v7))
        :effect (and (not (pred_6 ?v7))(not (pred_5 ?v3)) (pred_2 ?v7)))
)