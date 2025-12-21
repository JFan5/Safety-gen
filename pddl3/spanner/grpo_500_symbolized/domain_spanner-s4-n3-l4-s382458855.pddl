(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_1 type_3 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_2 ?v6 - type_5)
	(pred_5 ?v3 - type_1 ?v2 - type_4)
	(pred_6 ?v2 - type_4)
	(pred_4 ?v1 - type_5 ?v8 - type_5)
	(pred_3 ?v4 - type_3)
	(pred_1 ?v4 - type_3))                                                                                           
(:action op_1 
        :parameters (?v7 - type_5 ?v5 - type_5 ?v3 - type_1)
        :precondition (and (pred_2 ?v3 ?v7) 
                           (pred_4 ?v7 ?v5))                                                          
        :effect (and (not (pred_2 ?v3 ?v7)) (pred_2 ?v3 ?v5)))

(:action op_2 
        :parameters (?v6 - type_5 ?v2 - type_4 ?v3 - type_1)
        :precondition (and (pred_2 ?v3 ?v6) 
                           (pred_2 ?v2 ?v6))
        :effect (and (not (pred_2 ?v2 ?v6))
                     (pred_5 ?v3 ?v2)))

(:action op_3 
        :parameters (?v6 - type_5 ?v2 - type_4 ?v3 - type_1 ?v4 - type_3)
        :precondition (and (pred_2 ?v3 ?v6) 
		      	   (pred_2 ?v4 ?v6)
			   (pred_5 ?v3 ?v2)
			   (pred_6 ?v2)
			   (pred_1 ?v4))
        :effect (and (not (pred_1 ?v4))(not (pred_6 ?v2)) (pred_3 ?v4)))
)