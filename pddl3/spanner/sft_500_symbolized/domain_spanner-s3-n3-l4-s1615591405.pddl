(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_2 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v1 - type_5 ?v7 - type_4)
	(pred_1 ?v1 - type_2 ?v2 - type_3)
	(pred_3 ?v2 - type_3)
	(pred_5 ?v3 - type_4 ?v6 - type_4)
	(pred_6 ?v4 - type_1)
	(pred_2 ?v4 - type_1))                                                                                           
(:action op_2 
        :parameters (?v8 - type_4 ?v5 - type_4 ?v1 - type_2)
        :precondition (and (pred_4 ?v1 ?v8) 
                           (pred_5 ?v8 ?v5))                                                          
        :effect (and (not (pred_4 ?v1 ?v8)) (pred_4 ?v1 ?v5)))

(:action op_1 
        :parameters (?v7 - type_4 ?v2 - type_3 ?v1 - type_2)
        :precondition (and (pred_4 ?v1 ?v7) 
                           (pred_4 ?v2 ?v7))
        :effect (and (not (pred_4 ?v2 ?v7))
                     (pred_1 ?v1 ?v2)))

(:action op_3 
        :parameters (?v7 - type_4 ?v2 - type_3 ?v1 - type_2 ?v4 - type_1)
        :precondition (and (pred_4 ?v1 ?v7) 
		      	   (pred_4 ?v4 ?v7)
			   (pred_1 ?v1 ?v2)
			   (pred_3 ?v2)
			   (pred_2 ?v4))
        :effect (and (not (pred_2 ?v4))(not (pred_3 ?v2)) (pred_6 ?v4)))
)