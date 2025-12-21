(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_5 type_4 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_3 ?v6 - type_1)
	(pred_5 ?v7 - type_5 ?v5 - type_2)
	(pred_3 ?v5 - type_2)
	(pred_1 ?v1 - type_1 ?v4 - type_1)
	(pred_6 ?v3 - type_4)
	(pred_4 ?v3 - type_4))                                                                                           
(:action op_1 
        :parameters (?v8 - type_1 ?v2 - type_1 ?v7 - type_5)
        :precondition (and (pred_2 ?v7 ?v8) 
                           (pred_1 ?v8 ?v2))                                                          
        :effect (and (not (pred_2 ?v7 ?v8)) (pred_2 ?v7 ?v2)))

(:action op_2 
        :parameters (?v6 - type_1 ?v5 - type_2 ?v7 - type_5)
        :precondition (and (pred_2 ?v7 ?v6) 
                           (pred_2 ?v5 ?v6))
        :effect (and (not (pred_2 ?v5 ?v6))
                     (pred_5 ?v7 ?v5)))

(:action op_3 
        :parameters (?v6 - type_1 ?v5 - type_2 ?v7 - type_5 ?v3 - type_4)
        :precondition (and (pred_2 ?v7 ?v6) 
		      	   (pred_2 ?v3 ?v6)
			   (pred_5 ?v7 ?v5)
			   (pred_3 ?v5)
			   (pred_4 ?v3))
        :effect (and (not (pred_4 ?v3))(not (pred_3 ?v5)) (pred_6 ?v3)))
)