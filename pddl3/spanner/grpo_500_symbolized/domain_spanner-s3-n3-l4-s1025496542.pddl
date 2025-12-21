(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_3 type_4 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v6 - type_5 ?v5 - type_1)
	(pred_2 ?v6 - type_3 ?v3 - type_2)
	(pred_6 ?v3 - type_2)
	(pred_5 ?v2 - type_1 ?v8 - type_1)
	(pred_3 ?v7 - type_4)
	(pred_1 ?v7 - type_4))                                                                                           
(:action op_2 
        :parameters (?v1 - type_1 ?v4 - type_1 ?v6 - type_3)
        :precondition (and (pred_4 ?v6 ?v1) 
                           (pred_5 ?v1 ?v4))                                                          
        :effect (and (not (pred_4 ?v6 ?v1)) (pred_4 ?v6 ?v4)))

(:action op_1 
        :parameters (?v5 - type_1 ?v3 - type_2 ?v6 - type_3)
        :precondition (and (pred_4 ?v6 ?v5) 
                           (pred_4 ?v3 ?v5))
        :effect (and (not (pred_4 ?v3 ?v5))
                     (pred_2 ?v6 ?v3)))

(:action op_3 
        :parameters (?v5 - type_1 ?v3 - type_2 ?v6 - type_3 ?v7 - type_4)
        :precondition (and (pred_4 ?v6 ?v5) 
		      	   (pred_4 ?v7 ?v5)
			   (pred_2 ?v6 ?v3)
			   (pred_6 ?v3)
			   (pred_1 ?v7))
        :effect (and (not (pred_1 ?v7))(not (pred_6 ?v3)) (pred_3 ?v7)))
)