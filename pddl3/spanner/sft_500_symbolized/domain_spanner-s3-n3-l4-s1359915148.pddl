(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_3 type_5 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v1 - type_2 ?v7 - type_4)
	(pred_2 ?v1 - type_3 ?v2 - type_1)
	(pred_3 ?v2 - type_1)
	(pred_1 ?v8 - type_4 ?v6 - type_4)
	(pred_5 ?v3 - type_5)
	(pred_6 ?v3 - type_5))                                                                                           
(:action op_3 
        :parameters (?v4 - type_4 ?v5 - type_4 ?v1 - type_3)
        :precondition (and (pred_4 ?v1 ?v4) 
                           (pred_1 ?v4 ?v5))                                                          
        :effect (and (not (pred_4 ?v1 ?v4)) (pred_4 ?v1 ?v5)))

(:action op_2 
        :parameters (?v7 - type_4 ?v2 - type_1 ?v1 - type_3)
        :precondition (and (pred_4 ?v1 ?v7) 
                           (pred_4 ?v2 ?v7))
        :effect (and (not (pred_4 ?v2 ?v7))
                     (pred_2 ?v1 ?v2)))

(:action op_1 
        :parameters (?v7 - type_4 ?v2 - type_1 ?v1 - type_3 ?v3 - type_5)
        :precondition (and (pred_4 ?v1 ?v7) 
		      	   (pred_4 ?v3 ?v7)
			   (pred_2 ?v1 ?v2)
			   (pred_3 ?v2)
			   (pred_6 ?v3))
        :effect (and (not (pred_6 ?v3))(not (pred_3 ?v2)) (pred_5 ?v3)))
)