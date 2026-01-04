(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_4 type_3 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v5 - type_5 ?v7 - type_1)
	(pred_4 ?v5 - type_4 ?v6 - type_2)
	(pred_6 ?v6 - type_2)
	(pred_3 ?v3 - type_1 ?v8 - type_1)
	(pred_1 ?v1 - type_3)
	(pred_2 ?v1 - type_3))                                                                                           
(:action op_1 
        :parameters (?v4 - type_1 ?v2 - type_1 ?v5 - type_4)
        :precondition (and (pred_5 ?v5 ?v4) 
                           (pred_3 ?v4 ?v2))                                                          
        :effect (and (not (pred_5 ?v5 ?v4)) (pred_5 ?v5 ?v2)))

(:action op_2 
        :parameters (?v7 - type_1 ?v6 - type_2 ?v5 - type_4)
        :precondition (and (pred_5 ?v5 ?v7) 
                           (pred_5 ?v6 ?v7))
        :effect (and (not (pred_5 ?v6 ?v7))
                     (pred_4 ?v5 ?v6)))

(:action op_3 
        :parameters (?v7 - type_1 ?v6 - type_2 ?v5 - type_4 ?v1 - type_3)
        :precondition (and (pred_5 ?v5 ?v7) 
		      	   (pred_5 ?v1 ?v7)
			   (pred_4 ?v5 ?v6)
			   (pred_6 ?v6)
			   (pred_2 ?v1))
        :effect (and (not (pred_2 ?v1))(not (pred_6 ?v6)) (pred_1 ?v1)))
)