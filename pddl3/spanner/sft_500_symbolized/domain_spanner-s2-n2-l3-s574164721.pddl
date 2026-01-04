(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_2 type_3 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v8 - type_4 ?v4 - type_1)
	(pred_6 ?v8 - type_2 ?v5 - type_5)
	(pred_3 ?v5 - type_5)
	(pred_5 ?v1 - type_1 ?v2 - type_1)
	(pred_2 ?v3 - type_3)
	(pred_4 ?v3 - type_3))                                                                                           
(:action op_2 
        :parameters (?v6 - type_1 ?v7 - type_1 ?v8 - type_2)
        :precondition (and (pred_1 ?v8 ?v6) 
                           (pred_5 ?v6 ?v7))                                                          
        :effect (and (not (pred_1 ?v8 ?v6)) (pred_1 ?v8 ?v7)))

(:action op_1 
        :parameters (?v4 - type_1 ?v5 - type_5 ?v8 - type_2)
        :precondition (and (pred_1 ?v8 ?v4) 
                           (pred_1 ?v5 ?v4))
        :effect (and (not (pred_1 ?v5 ?v4))
                     (pred_6 ?v8 ?v5)))

(:action op_3 
        :parameters (?v4 - type_1 ?v5 - type_5 ?v8 - type_2 ?v3 - type_3)
        :precondition (and (pred_1 ?v8 ?v4) 
		      	   (pred_1 ?v3 ?v4)
			   (pred_6 ?v8 ?v5)
			   (pred_3 ?v5)
			   (pred_4 ?v3))
        :effect (and (not (pred_4 ?v3))(not (pred_3 ?v5)) (pred_2 ?v3)))
)