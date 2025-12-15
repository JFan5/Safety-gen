(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_2 type_4 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v7 - type_1 ?v1 - type_5)
	(pred_3 ?v7 - type_2 ?v3 - type_3)
	(pred_5 ?v3 - type_3)
	(pred_2 ?v2 - type_5 ?v4 - type_5)
	(pred_4 ?v5 - type_4)
	(pred_6 ?v5 - type_4))                                                                                           
(:action op_2 
        :parameters (?v6 - type_5 ?v8 - type_5 ?v7 - type_2)
        :precondition (and (pred_1 ?v7 ?v6) 
                           (pred_2 ?v6 ?v8))                                                          
        :effect (and (not (pred_1 ?v7 ?v6)) (pred_1 ?v7 ?v8)))

(:action op_1 
        :parameters (?v1 - type_5 ?v3 - type_3 ?v7 - type_2)
        :precondition (and (pred_1 ?v7 ?v1) 
                           (pred_1 ?v3 ?v1))
        :effect (and (not (pred_1 ?v3 ?v1))
                     (pred_3 ?v7 ?v3)))

(:action op_3 
        :parameters (?v1 - type_5 ?v3 - type_3 ?v7 - type_2 ?v5 - type_4)
        :precondition (and (pred_1 ?v7 ?v1) 
		      	   (pred_1 ?v5 ?v1)
			   (pred_3 ?v7 ?v3)
			   (pred_5 ?v3)
			   (pred_6 ?v5))
        :effect (and (not (pred_6 ?v5))(not (pred_5 ?v3)) (pred_4 ?v5)))
)