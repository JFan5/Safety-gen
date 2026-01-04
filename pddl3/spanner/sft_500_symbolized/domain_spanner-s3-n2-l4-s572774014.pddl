(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_2 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v6 - type_3 ?v3 - type_1)
	(pred_1 ?v6 - type_2 ?v7 - type_4)
	(pred_4 ?v7 - type_4)
	(pred_5 ?v8 - type_1 ?v4 - type_1)
	(pred_2 ?v2 - type_5)
	(pred_3 ?v2 - type_5))                                                                                           
(:action op_2 
        :parameters (?v5 - type_1 ?v1 - type_1 ?v6 - type_2)
        :precondition (and (pred_6 ?v6 ?v5) 
                           (pred_5 ?v5 ?v1))                                                          
        :effect (and (not (pred_6 ?v6 ?v5)) (pred_6 ?v6 ?v1)))

(:action op_3 
        :parameters (?v3 - type_1 ?v7 - type_4 ?v6 - type_2)
        :precondition (and (pred_6 ?v6 ?v3) 
                           (pred_6 ?v7 ?v3))
        :effect (and (not (pred_6 ?v7 ?v3))
                     (pred_1 ?v6 ?v7)))

(:action op_1 
        :parameters (?v3 - type_1 ?v7 - type_4 ?v6 - type_2 ?v2 - type_5)
        :precondition (and (pred_6 ?v6 ?v3) 
		      	   (pred_6 ?v2 ?v3)
			   (pred_1 ?v6 ?v7)
			   (pred_4 ?v7)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_4 ?v7)) (pred_2 ?v2)))
)