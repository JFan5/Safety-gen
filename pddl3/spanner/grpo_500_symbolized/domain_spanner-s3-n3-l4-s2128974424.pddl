(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_2 type_3 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v8 - type_1 ?v5 - type_5)
	(pred_3 ?v8 - type_2 ?v6 - type_4)
	(pred_5 ?v6 - type_4)
	(pred_6 ?v2 - type_5 ?v1 - type_5)
	(pred_1 ?v7 - type_3)
	(pred_4 ?v7 - type_3))                                                                                           
(:action op_1 
        :parameters (?v4 - type_5 ?v3 - type_5 ?v8 - type_2)
        :precondition (and (pred_2 ?v8 ?v4) 
                           (pred_6 ?v4 ?v3))                                                          
        :effect (and (not (pred_2 ?v8 ?v4)) (pred_2 ?v8 ?v3)))

(:action op_3 
        :parameters (?v5 - type_5 ?v6 - type_4 ?v8 - type_2)
        :precondition (and (pred_2 ?v8 ?v5) 
                           (pred_2 ?v6 ?v5))
        :effect (and (not (pred_2 ?v6 ?v5))
                     (pred_3 ?v8 ?v6)))

(:action op_2 
        :parameters (?v5 - type_5 ?v6 - type_4 ?v8 - type_2 ?v7 - type_3)
        :precondition (and (pred_2 ?v8 ?v5) 
		      	   (pred_2 ?v7 ?v5)
			   (pred_3 ?v8 ?v6)
			   (pred_5 ?v6)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_5 ?v6)) (pred_1 ?v7)))
)