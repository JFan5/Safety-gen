(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_2 type_1 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v7 - type_3 ?v3 - type_5)
	(pred_4 ?v7 - type_2 ?v2 - type_4)
	(pred_5 ?v2 - type_4)
	(pred_3 ?v4 - type_5 ?v8 - type_5)
	(pred_6 ?v1 - type_1)
	(pred_2 ?v1 - type_1))                                                                                           
(:action op_1 
        :parameters (?v5 - type_5 ?v6 - type_5 ?v7 - type_2)
        :precondition (and (pred_1 ?v7 ?v5) 
                           (pred_3 ?v5 ?v6))                                                          
        :effect (and (not (pred_1 ?v7 ?v5)) (pred_1 ?v7 ?v6)))

(:action op_3 
        :parameters (?v3 - type_5 ?v2 - type_4 ?v7 - type_2)
        :precondition (and (pred_1 ?v7 ?v3) 
                           (pred_1 ?v2 ?v3))
        :effect (and (not (pred_1 ?v2 ?v3))
                     (pred_4 ?v7 ?v2)))

(:action op_2 
        :parameters (?v3 - type_5 ?v2 - type_4 ?v7 - type_2 ?v1 - type_1)
        :precondition (and (pred_1 ?v7 ?v3) 
		      	   (pred_1 ?v1 ?v3)
			   (pred_4 ?v7 ?v2)
			   (pred_5 ?v2)
			   (pred_2 ?v1))
        :effect (and (not (pred_2 ?v1))(not (pred_5 ?v2)) (pred_6 ?v1)))
)