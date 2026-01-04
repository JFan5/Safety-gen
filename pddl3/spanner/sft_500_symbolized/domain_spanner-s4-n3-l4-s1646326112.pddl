(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_1 type_3 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_5 ?v7 - type_4)
	(pred_4 ?v3 - type_1 ?v6 - type_2)
	(pred_3 ?v6 - type_2)
	(pred_5 ?v5 - type_4 ?v8 - type_4)
	(pred_6 ?v2 - type_3)
	(pred_1 ?v2 - type_3))                                                                                           
(:action op_2 
        :parameters (?v1 - type_4 ?v4 - type_4 ?v3 - type_1)
        :precondition (and (pred_2 ?v3 ?v1) 
                           (pred_5 ?v1 ?v4))                                                          
        :effect (and (not (pred_2 ?v3 ?v1)) (pred_2 ?v3 ?v4)))

(:action op_3 
        :parameters (?v7 - type_4 ?v6 - type_2 ?v3 - type_1)
        :precondition (and (pred_2 ?v3 ?v7) 
                           (pred_2 ?v6 ?v7))
        :effect (and (not (pred_2 ?v6 ?v7))
                     (pred_4 ?v3 ?v6)))

(:action op_1 
        :parameters (?v7 - type_4 ?v6 - type_2 ?v3 - type_1 ?v2 - type_3)
        :precondition (and (pred_2 ?v3 ?v7) 
		      	   (pred_2 ?v2 ?v7)
			   (pred_4 ?v3 ?v6)
			   (pred_3 ?v6)
			   (pred_1 ?v2))
        :effect (and (not (pred_1 ?v2))(not (pred_3 ?v6)) (pred_6 ?v2)))
)