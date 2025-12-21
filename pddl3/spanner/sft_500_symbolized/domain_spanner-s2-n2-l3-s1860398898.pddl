(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_4 type_2 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v7 - type_5 ?v6 - type_3)
	(pred_3 ?v7 - type_4 ?v5 - type_1)
	(pred_4 ?v5 - type_1)
	(pred_1 ?v2 - type_3 ?v1 - type_3)
	(pred_5 ?v4 - type_2)
	(pred_6 ?v4 - type_2))                                                                                           
(:action op_2 
        :parameters (?v3 - type_3 ?v8 - type_3 ?v7 - type_4)
        :precondition (and (pred_2 ?v7 ?v3) 
                           (pred_1 ?v3 ?v8))                                                          
        :effect (and (not (pred_2 ?v7 ?v3)) (pred_2 ?v7 ?v8)))

(:action op_3 
        :parameters (?v6 - type_3 ?v5 - type_1 ?v7 - type_4)
        :precondition (and (pred_2 ?v7 ?v6) 
                           (pred_2 ?v5 ?v6))
        :effect (and (not (pred_2 ?v5 ?v6))
                     (pred_3 ?v7 ?v5)))

(:action op_1 
        :parameters (?v6 - type_3 ?v5 - type_1 ?v7 - type_4 ?v4 - type_2)
        :precondition (and (pred_2 ?v7 ?v6) 
		      	   (pred_2 ?v4 ?v6)
			   (pred_3 ?v7 ?v5)
			   (pred_4 ?v5)
			   (pred_6 ?v4))
        :effect (and (not (pred_6 ?v4))(not (pred_4 ?v5)) (pred_5 ?v4)))
)