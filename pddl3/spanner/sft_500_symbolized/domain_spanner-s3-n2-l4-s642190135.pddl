(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_1 type_3 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v7 - type_5 ?v4 - type_2)
	(pred_1 ?v7 - type_1 ?v3 - type_4)
	(pred_6 ?v3 - type_4)
	(pred_4 ?v1 - type_2 ?v8 - type_2)
	(pred_2 ?v5 - type_3)
	(pred_5 ?v5 - type_3))                                                                                           
(:action op_1 
        :parameters (?v2 - type_2 ?v6 - type_2 ?v7 - type_1)
        :precondition (and (pred_3 ?v7 ?v2) 
                           (pred_4 ?v2 ?v6))                                                          
        :effect (and (not (pred_3 ?v7 ?v2)) (pred_3 ?v7 ?v6)))

(:action op_2 
        :parameters (?v4 - type_2 ?v3 - type_4 ?v7 - type_1)
        :precondition (and (pred_3 ?v7 ?v4) 
                           (pred_3 ?v3 ?v4))
        :effect (and (not (pred_3 ?v3 ?v4))
                     (pred_1 ?v7 ?v3)))

(:action op_3 
        :parameters (?v4 - type_2 ?v3 - type_4 ?v7 - type_1 ?v5 - type_3)
        :precondition (and (pred_3 ?v7 ?v4) 
		      	   (pred_3 ?v5 ?v4)
			   (pred_1 ?v7 ?v3)
			   (pred_6 ?v3)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_6 ?v3)) (pred_2 ?v5)))
)