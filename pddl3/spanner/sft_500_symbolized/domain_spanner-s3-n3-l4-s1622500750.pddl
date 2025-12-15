(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_3 type_1 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v1 - type_5 ?v4 - type_2)
	(pred_4 ?v1 - type_3 ?v5 - type_4)
	(pred_3 ?v5 - type_4)
	(pred_2 ?v8 - type_2 ?v2 - type_2)
	(pred_6 ?v7 - type_1)
	(pred_5 ?v7 - type_1))                                                                                           
(:action op_2 
        :parameters (?v6 - type_2 ?v3 - type_2 ?v1 - type_3)
        :precondition (and (pred_1 ?v1 ?v6) 
                           (pred_2 ?v6 ?v3))                                                          
        :effect (and (not (pred_1 ?v1 ?v6)) (pred_1 ?v1 ?v3)))

(:action op_3 
        :parameters (?v4 - type_2 ?v5 - type_4 ?v1 - type_3)
        :precondition (and (pred_1 ?v1 ?v4) 
                           (pred_1 ?v5 ?v4))
        :effect (and (not (pred_1 ?v5 ?v4))
                     (pred_4 ?v1 ?v5)))

(:action op_1 
        :parameters (?v4 - type_2 ?v5 - type_4 ?v1 - type_3 ?v7 - type_1)
        :precondition (and (pred_1 ?v1 ?v4) 
		      	   (pred_1 ?v7 ?v4)
			   (pred_4 ?v1 ?v5)
			   (pred_3 ?v5)
			   (pred_5 ?v7))
        :effect (and (not (pred_5 ?v7))(not (pred_3 ?v5)) (pred_6 ?v7)))
)