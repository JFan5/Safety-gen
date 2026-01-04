(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_1 type_4 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v7 - type_5 ?v4 - type_3)
	(pred_3 ?v7 - type_1 ?v2 - type_2)
	(pred_2 ?v2 - type_2)
	(pred_1 ?v8 - type_3 ?v6 - type_3)
	(pred_4 ?v3 - type_4)
	(pred_5 ?v3 - type_4))                                                                                           
(:action op_3 
        :parameters (?v5 - type_3 ?v1 - type_3 ?v7 - type_1)
        :precondition (and (pred_6 ?v7 ?v5) 
                           (pred_1 ?v5 ?v1))                                                          
        :effect (and (not (pred_6 ?v7 ?v5)) (pred_6 ?v7 ?v1)))

(:action op_2 
        :parameters (?v4 - type_3 ?v2 - type_2 ?v7 - type_1)
        :precondition (and (pred_6 ?v7 ?v4) 
                           (pred_6 ?v2 ?v4))
        :effect (and (not (pred_6 ?v2 ?v4))
                     (pred_3 ?v7 ?v2)))

(:action op_1 
        :parameters (?v4 - type_3 ?v2 - type_2 ?v7 - type_1 ?v3 - type_4)
        :precondition (and (pred_6 ?v7 ?v4) 
		      	   (pred_6 ?v3 ?v4)
			   (pred_3 ?v7 ?v2)
			   (pred_2 ?v2)
			   (pred_5 ?v3))
        :effect (and (not (pred_5 ?v3))(not (pred_2 ?v2)) (pred_4 ?v3)))
)