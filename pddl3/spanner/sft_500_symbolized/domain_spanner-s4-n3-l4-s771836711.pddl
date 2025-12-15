(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_3 type_2 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_4 ?v4 - type_1)
	(pred_3 ?v8 - type_3 ?v6 - type_5)
	(pred_6 ?v6 - type_5)
	(pred_2 ?v3 - type_1 ?v1 - type_1)
	(pred_4 ?v7 - type_2)
	(pred_1 ?v7 - type_2))                                                                                           
(:action op_3 
        :parameters (?v5 - type_1 ?v2 - type_1 ?v8 - type_3)
        :precondition (and (pred_5 ?v8 ?v5) 
                           (pred_2 ?v5 ?v2))                                                          
        :effect (and (not (pred_5 ?v8 ?v5)) (pred_5 ?v8 ?v2)))

(:action op_1 
        :parameters (?v4 - type_1 ?v6 - type_5 ?v8 - type_3)
        :precondition (and (pred_5 ?v8 ?v4) 
                           (pred_5 ?v6 ?v4))
        :effect (and (not (pred_5 ?v6 ?v4))
                     (pred_3 ?v8 ?v6)))

(:action op_2 
        :parameters (?v4 - type_1 ?v6 - type_5 ?v8 - type_3 ?v7 - type_2)
        :precondition (and (pred_5 ?v8 ?v4) 
		      	   (pred_5 ?v7 ?v4)
			   (pred_3 ?v8 ?v6)
			   (pred_6 ?v6)
			   (pred_1 ?v7))
        :effect (and (not (pred_1 ?v7))(not (pred_6 ?v6)) (pred_4 ?v7)))
)