(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_2 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v4 - type_5 ?v6 - type_4)
	(pred_4 ?v4 - type_2 ?v1 - type_3)
	(pred_6 ?v1 - type_3)
	(pred_2 ?v2 - type_4 ?v7 - type_4)
	(pred_5 ?v3 - type_1)
	(pred_3 ?v3 - type_1))                                                                                           
(:action op_3 
        :parameters (?v8 - type_4 ?v5 - type_4 ?v4 - type_2)
        :precondition (and (pred_1 ?v4 ?v8) 
                           (pred_2 ?v8 ?v5))                                                          
        :effect (and (not (pred_1 ?v4 ?v8)) (pred_1 ?v4 ?v5)))

(:action op_1 
        :parameters (?v6 - type_4 ?v1 - type_3 ?v4 - type_2)
        :precondition (and (pred_1 ?v4 ?v6) 
                           (pred_1 ?v1 ?v6))
        :effect (and (not (pred_1 ?v1 ?v6))
                     (pred_4 ?v4 ?v1)))

(:action op_2 
        :parameters (?v6 - type_4 ?v1 - type_3 ?v4 - type_2 ?v3 - type_1)
        :precondition (and (pred_1 ?v4 ?v6) 
		      	   (pred_1 ?v3 ?v6)
			   (pred_4 ?v4 ?v1)
			   (pred_6 ?v1)
			   (pred_3 ?v3))
        :effect (and (not (pred_3 ?v3))(not (pred_6 ?v1)) (pred_5 ?v3)))
)