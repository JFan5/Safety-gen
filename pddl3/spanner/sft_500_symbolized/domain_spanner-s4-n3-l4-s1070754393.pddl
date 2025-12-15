(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_1 type_4 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v8 - type_2 ?v1 - type_5)
	(pred_4 ?v8 - type_1 ?v3 - type_3)
	(pred_2 ?v3 - type_3)
	(pred_3 ?v5 - type_5 ?v4 - type_5)
	(pred_1 ?v7 - type_4)
	(pred_5 ?v7 - type_4))                                                                                           
(:action op_2 
        :parameters (?v6 - type_5 ?v2 - type_5 ?v8 - type_1)
        :precondition (and (pred_6 ?v8 ?v6) 
                           (pred_3 ?v6 ?v2))                                                          
        :effect (and (not (pred_6 ?v8 ?v6)) (pred_6 ?v8 ?v2)))

(:action op_1 
        :parameters (?v1 - type_5 ?v3 - type_3 ?v8 - type_1)
        :precondition (and (pred_6 ?v8 ?v1) 
                           (pred_6 ?v3 ?v1))
        :effect (and (not (pred_6 ?v3 ?v1))
                     (pred_4 ?v8 ?v3)))

(:action op_3 
        :parameters (?v1 - type_5 ?v3 - type_3 ?v8 - type_1 ?v7 - type_4)
        :precondition (and (pred_6 ?v8 ?v1) 
		      	   (pred_6 ?v7 ?v1)
			   (pred_4 ?v8 ?v3)
			   (pred_2 ?v3)
			   (pred_5 ?v7))
        :effect (and (not (pred_5 ?v7))(not (pred_2 ?v3)) (pred_1 ?v7)))
)