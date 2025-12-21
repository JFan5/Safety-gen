(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_1 type_2 type_4 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v4 - type_3 ?v8 - type_5)
	(pred_3 ?v4 - type_1 ?v6 - type_4)
	(pred_4 ?v6 - type_4)
	(pred_6 ?v1 - type_5 ?v2 - type_5)
	(pred_1 ?v7 - type_2)
	(pred_2 ?v7 - type_2))                                                                                           
(:action op_1 
        :parameters (?v5 - type_5 ?v3 - type_5 ?v4 - type_1)
        :precondition (and (pred_5 ?v4 ?v5) 
                           (pred_6 ?v5 ?v3))                                                          
        :effect (and (not (pred_5 ?v4 ?v5)) (pred_5 ?v4 ?v3)))

(:action op_2 
        :parameters (?v8 - type_5 ?v6 - type_4 ?v4 - type_1)
        :precondition (and (pred_5 ?v4 ?v8) 
                           (pred_5 ?v6 ?v8))
        :effect (and (not (pred_5 ?v6 ?v8))
                     (pred_3 ?v4 ?v6)))

(:action op_3 
        :parameters (?v8 - type_5 ?v6 - type_4 ?v4 - type_1 ?v7 - type_2)
        :precondition (and (pred_5 ?v4 ?v8) 
		      	   (pred_5 ?v7 ?v8)
			   (pred_3 ?v4 ?v6)
			   (pred_4 ?v6)
			   (pred_2 ?v7))
        :effect (and (not (pred_2 ?v7))(not (pred_4 ?v6)) (pred_1 ?v7)))
)