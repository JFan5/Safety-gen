(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_1 type_4 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v1 - type_5 ?v4 - type_3)
	(pred_6 ?v1 - type_1 ?v5 - type_2)
	(pred_1 ?v5 - type_2)
	(pred_3 ?v2 - type_3 ?v8 - type_3)
	(pred_2 ?v7 - type_4)
	(pred_4 ?v7 - type_4))                                                                                           
(:action op_1 
        :parameters (?v3 - type_3 ?v6 - type_3 ?v1 - type_1)
        :precondition (and (pred_5 ?v1 ?v3) 
                           (pred_3 ?v3 ?v6))                                                          
        :effect (and (not (pred_5 ?v1 ?v3)) (pred_5 ?v1 ?v6)))

(:action op_2 
        :parameters (?v4 - type_3 ?v5 - type_2 ?v1 - type_1)
        :precondition (and (pred_5 ?v1 ?v4) 
                           (pred_5 ?v5 ?v4))
        :effect (and (not (pred_5 ?v5 ?v4))
                     (pred_6 ?v1 ?v5)))

(:action op_3 
        :parameters (?v4 - type_3 ?v5 - type_2 ?v1 - type_1 ?v7 - type_4)
        :precondition (and (pred_5 ?v1 ?v4) 
		      	   (pred_5 ?v7 ?v4)
			   (pred_6 ?v1 ?v5)
			   (pred_1 ?v5)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_1 ?v5)) (pred_2 ?v7)))
)