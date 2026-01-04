(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_2 type_1 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_3 ?v6 - type_5)
	(pred_5 ?v5 - type_2 ?v2 - type_4)
	(pred_1 ?v2 - type_4)
	(pred_2 ?v4 - type_5 ?v8 - type_5)
	(pred_6 ?v3 - type_1)
	(pred_3 ?v3 - type_1))                                                                                           
(:action op_1 
        :parameters (?v7 - type_5 ?v1 - type_5 ?v5 - type_2)
        :precondition (and (pred_4 ?v5 ?v7) 
                           (pred_2 ?v7 ?v1))                                                          
        :effect (and (not (pred_4 ?v5 ?v7)) (pred_4 ?v5 ?v1)))

(:action op_2 
        :parameters (?v6 - type_5 ?v2 - type_4 ?v5 - type_2)
        :precondition (and (pred_4 ?v5 ?v6) 
                           (pred_4 ?v2 ?v6))
        :effect (and (not (pred_4 ?v2 ?v6))
                     (pred_5 ?v5 ?v2)))

(:action op_3 
        :parameters (?v6 - type_5 ?v2 - type_4 ?v5 - type_2 ?v3 - type_1)
        :precondition (and (pred_4 ?v5 ?v6) 
		      	   (pred_4 ?v3 ?v6)
			   (pred_5 ?v5 ?v2)
			   (pred_1 ?v2)
			   (pred_3 ?v3))
        :effect (and (not (pred_3 ?v3))(not (pred_1 ?v2)) (pred_6 ?v3)))
)