(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_1 type_3 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v6 - type_5 ?v5 - type_4)
	(pred_1 ?v6 - type_1 ?v3 - type_2)
	(pred_4 ?v3 - type_2)
	(pred_5 ?v1 - type_4 ?v7 - type_4)
	(pred_3 ?v2 - type_3)
	(pred_6 ?v2 - type_3))                                                                                           
(:action op_1 
        :parameters (?v8 - type_4 ?v4 - type_4 ?v6 - type_1)
        :precondition (and (pred_2 ?v6 ?v8) 
                           (pred_5 ?v8 ?v4))                                                          
        :effect (and (not (pred_2 ?v6 ?v8)) (pred_2 ?v6 ?v4)))

(:action op_3 
        :parameters (?v5 - type_4 ?v3 - type_2 ?v6 - type_1)
        :precondition (and (pred_2 ?v6 ?v5) 
                           (pred_2 ?v3 ?v5))
        :effect (and (not (pred_2 ?v3 ?v5))
                     (pred_1 ?v6 ?v3)))

(:action op_2 
        :parameters (?v5 - type_4 ?v3 - type_2 ?v6 - type_1 ?v2 - type_3)
        :precondition (and (pred_2 ?v6 ?v5) 
		      	   (pred_2 ?v2 ?v5)
			   (pred_1 ?v6 ?v3)
			   (pred_4 ?v3)
			   (pred_6 ?v2))
        :effect (and (not (pred_6 ?v2))(not (pred_4 ?v3)) (pred_3 ?v2)))
)