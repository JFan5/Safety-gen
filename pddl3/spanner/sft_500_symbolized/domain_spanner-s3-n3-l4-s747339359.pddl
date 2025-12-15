(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_2 type_5 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v7 - type_1 ?v6 - type_4)
	(pred_3 ?v7 - type_2 ?v5 - type_3)
	(pred_1 ?v5 - type_3)
	(pred_4 ?v4 - type_4 ?v3 - type_4)
	(pred_6 ?v1 - type_5)
	(pred_2 ?v1 - type_5))                                                                                           
(:action op_3 
        :parameters (?v2 - type_4 ?v8 - type_4 ?v7 - type_2)
        :precondition (and (pred_5 ?v7 ?v2) 
                           (pred_4 ?v2 ?v8))                                                          
        :effect (and (not (pred_5 ?v7 ?v2)) (pred_5 ?v7 ?v8)))

(:action op_2 
        :parameters (?v6 - type_4 ?v5 - type_3 ?v7 - type_2)
        :precondition (and (pred_5 ?v7 ?v6) 
                           (pred_5 ?v5 ?v6))
        :effect (and (not (pred_5 ?v5 ?v6))
                     (pred_3 ?v7 ?v5)))

(:action op_1 
        :parameters (?v6 - type_4 ?v5 - type_3 ?v7 - type_2 ?v1 - type_5)
        :precondition (and (pred_5 ?v7 ?v6) 
		      	   (pred_5 ?v1 ?v6)
			   (pred_3 ?v7 ?v5)
			   (pred_1 ?v5)
			   (pred_2 ?v1))
        :effect (and (not (pred_2 ?v1))(not (pred_1 ?v5)) (pred_6 ?v1)))
)