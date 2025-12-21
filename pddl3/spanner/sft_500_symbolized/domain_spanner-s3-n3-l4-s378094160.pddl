(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_4 type_3 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v2 - type_1 ?v4 - type_2)
	(pred_1 ?v2 - type_4 ?v1 - type_5)
	(pred_5 ?v1 - type_5)
	(pred_4 ?v5 - type_2 ?v8 - type_2)
	(pred_6 ?v6 - type_3)
	(pred_3 ?v6 - type_3))                                                                                           
(:action op_2 
        :parameters (?v3 - type_2 ?v7 - type_2 ?v2 - type_4)
        :precondition (and (pred_2 ?v2 ?v3) 
                           (pred_4 ?v3 ?v7))                                                          
        :effect (and (not (pred_2 ?v2 ?v3)) (pred_2 ?v2 ?v7)))

(:action op_3 
        :parameters (?v4 - type_2 ?v1 - type_5 ?v2 - type_4)
        :precondition (and (pred_2 ?v2 ?v4) 
                           (pred_2 ?v1 ?v4))
        :effect (and (not (pred_2 ?v1 ?v4))
                     (pred_1 ?v2 ?v1)))

(:action op_1 
        :parameters (?v4 - type_2 ?v1 - type_5 ?v2 - type_4 ?v6 - type_3)
        :precondition (and (pred_2 ?v2 ?v4) 
		      	   (pred_2 ?v6 ?v4)
			   (pred_1 ?v2 ?v1)
			   (pred_5 ?v1)
			   (pred_3 ?v6))
        :effect (and (not (pred_3 ?v6))(not (pred_5 ?v1)) (pred_6 ?v6)))
)