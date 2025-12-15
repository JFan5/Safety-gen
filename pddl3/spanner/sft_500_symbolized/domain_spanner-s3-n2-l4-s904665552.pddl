(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_1 type_2 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_5 ?v7 - type_3)
	(pred_2 ?v6 - type_1 ?v2 - type_4)
	(pred_1 ?v2 - type_4)
	(pred_4 ?v5 - type_3 ?v8 - type_3)
	(pred_3 ?v3 - type_2)
	(pred_6 ?v3 - type_2))                                                                                           
(:action op_3 
        :parameters (?v4 - type_3 ?v1 - type_3 ?v6 - type_1)
        :precondition (and (pred_5 ?v6 ?v4) 
                           (pred_4 ?v4 ?v1))                                                          
        :effect (and (not (pred_5 ?v6 ?v4)) (pred_5 ?v6 ?v1)))

(:action op_1 
        :parameters (?v7 - type_3 ?v2 - type_4 ?v6 - type_1)
        :precondition (and (pred_5 ?v6 ?v7) 
                           (pred_5 ?v2 ?v7))
        :effect (and (not (pred_5 ?v2 ?v7))
                     (pred_2 ?v6 ?v2)))

(:action op_2 
        :parameters (?v7 - type_3 ?v2 - type_4 ?v6 - type_1 ?v3 - type_2)
        :precondition (and (pred_5 ?v6 ?v7) 
		      	   (pred_5 ?v3 ?v7)
			   (pred_2 ?v6 ?v2)
			   (pred_1 ?v2)
			   (pred_6 ?v3))
        :effect (and (not (pred_6 ?v3))(not (pred_1 ?v2)) (pred_3 ?v3)))
)