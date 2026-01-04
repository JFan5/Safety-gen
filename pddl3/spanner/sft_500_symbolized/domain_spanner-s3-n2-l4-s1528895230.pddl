(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_5 type_3 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v7 - type_2 ?v1 - type_1)
	(pred_2 ?v7 - type_5 ?v2 - type_4)
	(pred_4 ?v2 - type_4)
	(pred_1 ?v4 - type_1 ?v5 - type_1)
	(pred_5 ?v3 - type_3)
	(pred_6 ?v3 - type_3))                                                                                           
(:action op_1 
        :parameters (?v6 - type_1 ?v8 - type_1 ?v7 - type_5)
        :precondition (and (pred_3 ?v7 ?v6) 
                           (pred_1 ?v6 ?v8))                                                          
        :effect (and (not (pred_3 ?v7 ?v6)) (pred_3 ?v7 ?v8)))

(:action op_3 
        :parameters (?v1 - type_1 ?v2 - type_4 ?v7 - type_5)
        :precondition (and (pred_3 ?v7 ?v1) 
                           (pred_3 ?v2 ?v1))
        :effect (and (not (pred_3 ?v2 ?v1))
                     (pred_2 ?v7 ?v2)))

(:action op_2 
        :parameters (?v1 - type_1 ?v2 - type_4 ?v7 - type_5 ?v3 - type_3)
        :precondition (and (pred_3 ?v7 ?v1) 
		      	   (pred_3 ?v3 ?v1)
			   (pred_2 ?v7 ?v2)
			   (pred_4 ?v2)
			   (pred_6 ?v3))
        :effect (and (not (pred_6 ?v3))(not (pred_4 ?v2)) (pred_5 ?v3)))
)