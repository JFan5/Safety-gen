(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_2 type_4 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_1 ?v8 - type_5)
	(pred_1 ?v4 - type_2 ?v6 - type_3)
	(pred_5 ?v6 - type_3)
	(pred_6 ?v3 - type_5 ?v5 - type_5)
	(pred_4 ?v2 - type_4)
	(pred_3 ?v2 - type_4))                                                                                           
(:action op_2 
        :parameters (?v7 - type_5 ?v1 - type_5 ?v4 - type_2)
        :precondition (and (pred_2 ?v4 ?v7) 
                           (pred_6 ?v7 ?v1))                                                          
        :effect (and (not (pred_2 ?v4 ?v7)) (pred_2 ?v4 ?v1)))

(:action op_3 
        :parameters (?v8 - type_5 ?v6 - type_3 ?v4 - type_2)
        :precondition (and (pred_2 ?v4 ?v8) 
                           (pred_2 ?v6 ?v8))
        :effect (and (not (pred_2 ?v6 ?v8))
                     (pred_1 ?v4 ?v6)))

(:action op_1 
        :parameters (?v8 - type_5 ?v6 - type_3 ?v4 - type_2 ?v2 - type_4)
        :precondition (and (pred_2 ?v4 ?v8) 
		      	   (pred_2 ?v2 ?v8)
			   (pred_1 ?v4 ?v6)
			   (pred_5 ?v6)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_5 ?v6)) (pred_4 ?v2)))
)