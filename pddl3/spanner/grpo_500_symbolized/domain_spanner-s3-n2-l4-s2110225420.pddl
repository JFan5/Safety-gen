(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_4 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v4 - type_5 ?v6 - type_2)
	(pred_6 ?v4 - type_4 ?v5 - type_3)
	(pred_1 ?v5 - type_3)
	(pred_2 ?v3 - type_2 ?v8 - type_2)
	(pred_5 ?v7 - type_1)
	(pred_4 ?v7 - type_1))                                                                                           
(:action op_1 
        :parameters (?v2 - type_2 ?v1 - type_2 ?v4 - type_4)
        :precondition (and (pred_3 ?v4 ?v2) 
                           (pred_2 ?v2 ?v1))                                                          
        :effect (and (not (pred_3 ?v4 ?v2)) (pred_3 ?v4 ?v1)))

(:action op_2 
        :parameters (?v6 - type_2 ?v5 - type_3 ?v4 - type_4)
        :precondition (and (pred_3 ?v4 ?v6) 
                           (pred_3 ?v5 ?v6))
        :effect (and (not (pred_3 ?v5 ?v6))
                     (pred_6 ?v4 ?v5)))

(:action op_3 
        :parameters (?v6 - type_2 ?v5 - type_3 ?v4 - type_4 ?v7 - type_1)
        :precondition (and (pred_3 ?v4 ?v6) 
		      	   (pred_3 ?v7 ?v6)
			   (pred_6 ?v4 ?v5)
			   (pred_1 ?v5)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_1 ?v5)) (pred_5 ?v7)))
)