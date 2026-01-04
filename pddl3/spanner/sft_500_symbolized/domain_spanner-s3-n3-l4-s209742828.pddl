(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_1 type_5 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v1 - type_3 ?v3 - type_2)
	(pred_5 ?v1 - type_1 ?v7 - type_4)
	(pred_1 ?v7 - type_4)
	(pred_2 ?v2 - type_2 ?v4 - type_2)
	(pred_4 ?v6 - type_5)
	(pred_3 ?v6 - type_5))                                                                                           
(:action op_1 
        :parameters (?v5 - type_2 ?v8 - type_2 ?v1 - type_1)
        :precondition (and (pred_6 ?v1 ?v5) 
                           (pred_2 ?v5 ?v8))                                                          
        :effect (and (not (pred_6 ?v1 ?v5)) (pred_6 ?v1 ?v8)))

(:action op_3 
        :parameters (?v3 - type_2 ?v7 - type_4 ?v1 - type_1)
        :precondition (and (pred_6 ?v1 ?v3) 
                           (pred_6 ?v7 ?v3))
        :effect (and (not (pred_6 ?v7 ?v3))
                     (pred_5 ?v1 ?v7)))

(:action op_2 
        :parameters (?v3 - type_2 ?v7 - type_4 ?v1 - type_1 ?v6 - type_5)
        :precondition (and (pred_6 ?v1 ?v3) 
		      	   (pred_6 ?v6 ?v3)
			   (pred_5 ?v1 ?v7)
			   (pred_1 ?v7)
			   (pred_3 ?v6))
        :effect (and (not (pred_3 ?v6))(not (pred_1 ?v7)) (pred_4 ?v6)))
)