(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_2 type_3 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v7 - type_1 ?v6 - type_4)
	(pred_2 ?v7 - type_2 ?v5 - type_5)
	(pred_5 ?v5 - type_5)
	(pred_6 ?v3 - type_4 ?v4 - type_4)
	(pred_3 ?v1 - type_3)
	(pred_4 ?v1 - type_3))                                                                                           
(:action op_1 
        :parameters (?v2 - type_4 ?v8 - type_4 ?v7 - type_2)
        :precondition (and (pred_1 ?v7 ?v2) 
                           (pred_6 ?v2 ?v8))                                                          
        :effect (and (not (pred_1 ?v7 ?v2)) (pred_1 ?v7 ?v8)))

(:action op_3 
        :parameters (?v6 - type_4 ?v5 - type_5 ?v7 - type_2)
        :precondition (and (pred_1 ?v7 ?v6) 
                           (pred_1 ?v5 ?v6))
        :effect (and (not (pred_1 ?v5 ?v6))
                     (pred_2 ?v7 ?v5)))

(:action op_2 
        :parameters (?v6 - type_4 ?v5 - type_5 ?v7 - type_2 ?v1 - type_3)
        :precondition (and (pred_1 ?v7 ?v6) 
		      	   (pred_1 ?v1 ?v6)
			   (pred_2 ?v7 ?v5)
			   (pred_5 ?v5)
			   (pred_4 ?v1))
        :effect (and (not (pred_4 ?v1))(not (pred_5 ?v5)) (pred_3 ?v1)))
)