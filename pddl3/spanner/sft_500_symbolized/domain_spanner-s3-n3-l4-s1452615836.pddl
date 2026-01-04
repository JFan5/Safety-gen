(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_3 type_1 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v8 - type_5 ?v7 - type_2)
	(pred_2 ?v8 - type_3 ?v1 - type_4)
	(pred_6 ?v1 - type_4)
	(pred_4 ?v6 - type_2 ?v5 - type_2)
	(pred_1 ?v4 - type_1)
	(pred_5 ?v4 - type_1))                                                                                           
(:action op_1 
        :parameters (?v3 - type_2 ?v2 - type_2 ?v8 - type_3)
        :precondition (and (pred_3 ?v8 ?v3) 
                           (pred_4 ?v3 ?v2))                                                          
        :effect (and (not (pred_3 ?v8 ?v3)) (pred_3 ?v8 ?v2)))

(:action op_3 
        :parameters (?v7 - type_2 ?v1 - type_4 ?v8 - type_3)
        :precondition (and (pred_3 ?v8 ?v7) 
                           (pred_3 ?v1 ?v7))
        :effect (and (not (pred_3 ?v1 ?v7))
                     (pred_2 ?v8 ?v1)))

(:action op_2 
        :parameters (?v7 - type_2 ?v1 - type_4 ?v8 - type_3 ?v4 - type_1)
        :precondition (and (pred_3 ?v8 ?v7) 
		      	   (pred_3 ?v4 ?v7)
			   (pred_2 ?v8 ?v1)
			   (pred_6 ?v1)
			   (pred_5 ?v4))
        :effect (and (not (pred_5 ?v4))(not (pred_6 ?v1)) (pred_1 ?v4)))
)