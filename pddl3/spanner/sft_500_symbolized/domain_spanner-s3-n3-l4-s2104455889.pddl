(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_5 type_4 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v3 - type_1 ?v4 - type_2)
	(pred_5 ?v3 - type_5 ?v2 - type_3)
	(pred_6 ?v2 - type_3)
	(pred_2 ?v5 - type_2 ?v1 - type_2)
	(pred_4 ?v7 - type_4)
	(pred_3 ?v7 - type_4))                                                                                           
(:action op_1 
        :parameters (?v6 - type_2 ?v8 - type_2 ?v3 - type_5)
        :precondition (and (pred_1 ?v3 ?v6) 
                           (pred_2 ?v6 ?v8))                                                          
        :effect (and (not (pred_1 ?v3 ?v6)) (pred_1 ?v3 ?v8)))

(:action op_2 
        :parameters (?v4 - type_2 ?v2 - type_3 ?v3 - type_5)
        :precondition (and (pred_1 ?v3 ?v4) 
                           (pred_1 ?v2 ?v4))
        :effect (and (not (pred_1 ?v2 ?v4))
                     (pred_5 ?v3 ?v2)))

(:action op_3 
        :parameters (?v4 - type_2 ?v2 - type_3 ?v3 - type_5 ?v7 - type_4)
        :precondition (and (pred_1 ?v3 ?v4) 
		      	   (pred_1 ?v7 ?v4)
			   (pred_5 ?v3 ?v2)
			   (pred_6 ?v2)
			   (pred_3 ?v7))
        :effect (and (not (pred_3 ?v7))(not (pred_6 ?v2)) (pred_4 ?v7)))
)