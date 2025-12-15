(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_1 type_3 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_4 ?v4 - type_2)
	(pred_2 ?v1 - type_1 ?v2 - type_5)
	(pred_6 ?v2 - type_5)
	(pred_5 ?v3 - type_2 ?v7 - type_2)
	(pred_4 ?v6 - type_3)
	(pred_1 ?v6 - type_3))                                                                                           
(:action op_3 
        :parameters (?v8 - type_2 ?v5 - type_2 ?v1 - type_1)
        :precondition (and (pred_3 ?v1 ?v8) 
                           (pred_5 ?v8 ?v5))                                                          
        :effect (and (not (pred_3 ?v1 ?v8)) (pred_3 ?v1 ?v5)))

(:action op_1 
        :parameters (?v4 - type_2 ?v2 - type_5 ?v1 - type_1)
        :precondition (and (pred_3 ?v1 ?v4) 
                           (pred_3 ?v2 ?v4))
        :effect (and (not (pred_3 ?v2 ?v4))
                     (pred_2 ?v1 ?v2)))

(:action op_2 
        :parameters (?v4 - type_2 ?v2 - type_5 ?v1 - type_1 ?v6 - type_3)
        :precondition (and (pred_3 ?v1 ?v4) 
		      	   (pred_3 ?v6 ?v4)
			   (pred_2 ?v1 ?v2)
			   (pred_6 ?v2)
			   (pred_1 ?v6))
        :effect (and (not (pred_1 ?v6))(not (pred_6 ?v2)) (pred_4 ?v6)))
)