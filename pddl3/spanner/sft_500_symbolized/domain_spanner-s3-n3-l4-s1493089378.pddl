(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_4 type_1 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v7 - type_3 ?v3 - type_5)
	(pred_1 ?v7 - type_4 ?v2 - type_2)
	(pred_3 ?v2 - type_2)
	(pred_6 ?v5 - type_5 ?v1 - type_5)
	(pred_2 ?v6 - type_1)
	(pred_4 ?v6 - type_1))                                                                                           
(:action op_3 
        :parameters (?v4 - type_5 ?v8 - type_5 ?v7 - type_4)
        :precondition (and (pred_5 ?v7 ?v4) 
                           (pred_6 ?v4 ?v8))                                                          
        :effect (and (not (pred_5 ?v7 ?v4)) (pred_5 ?v7 ?v8)))

(:action op_1 
        :parameters (?v3 - type_5 ?v2 - type_2 ?v7 - type_4)
        :precondition (and (pred_5 ?v7 ?v3) 
                           (pred_5 ?v2 ?v3))
        :effect (and (not (pred_5 ?v2 ?v3))
                     (pred_1 ?v7 ?v2)))

(:action op_2 
        :parameters (?v3 - type_5 ?v2 - type_2 ?v7 - type_4 ?v6 - type_1)
        :precondition (and (pred_5 ?v7 ?v3) 
		      	   (pred_5 ?v6 ?v3)
			   (pred_1 ?v7 ?v2)
			   (pred_3 ?v2)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_3 ?v2)) (pred_2 ?v6)))
)