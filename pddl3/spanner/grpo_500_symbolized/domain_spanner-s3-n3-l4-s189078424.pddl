(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_2 type_1 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v6 - type_4 ?v4 - type_3)
	(pred_3 ?v6 - type_2 ?v3 - type_5)
	(pred_6 ?v3 - type_5)
	(pred_5 ?v5 - type_3 ?v1 - type_3)
	(pred_1 ?v2 - type_1)
	(pred_4 ?v2 - type_1))                                                                                           
(:action op_1 
        :parameters (?v8 - type_3 ?v7 - type_3 ?v6 - type_2)
        :precondition (and (pred_2 ?v6 ?v8) 
                           (pred_5 ?v8 ?v7))                                                          
        :effect (and (not (pred_2 ?v6 ?v8)) (pred_2 ?v6 ?v7)))

(:action op_2 
        :parameters (?v4 - type_3 ?v3 - type_5 ?v6 - type_2)
        :precondition (and (pred_2 ?v6 ?v4) 
                           (pred_2 ?v3 ?v4))
        :effect (and (not (pred_2 ?v3 ?v4))
                     (pred_3 ?v6 ?v3)))

(:action op_3 
        :parameters (?v4 - type_3 ?v3 - type_5 ?v6 - type_2 ?v2 - type_1)
        :precondition (and (pred_2 ?v6 ?v4) 
		      	   (pred_2 ?v2 ?v4)
			   (pred_3 ?v6 ?v3)
			   (pred_6 ?v3)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_6 ?v3)) (pred_1 ?v2)))
)