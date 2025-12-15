(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_4 type_2 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_1 ?v7 - type_3)
	(pred_1 ?v8 - type_4 ?v5 - type_5)
	(pred_2 ?v5 - type_5)
	(pred_3 ?v6 - type_3 ?v2 - type_3)
	(pred_4 ?v3 - type_2)
	(pred_6 ?v3 - type_2))                                                                                           
(:action op_2 
        :parameters (?v4 - type_3 ?v1 - type_3 ?v8 - type_4)
        :precondition (and (pred_5 ?v8 ?v4) 
                           (pred_3 ?v4 ?v1))                                                          
        :effect (and (not (pred_5 ?v8 ?v4)) (pred_5 ?v8 ?v1)))

(:action op_3 
        :parameters (?v7 - type_3 ?v5 - type_5 ?v8 - type_4)
        :precondition (and (pred_5 ?v8 ?v7) 
                           (pred_5 ?v5 ?v7))
        :effect (and (not (pred_5 ?v5 ?v7))
                     (pred_1 ?v8 ?v5)))

(:action op_1 
        :parameters (?v7 - type_3 ?v5 - type_5 ?v8 - type_4 ?v3 - type_2)
        :precondition (and (pred_5 ?v8 ?v7) 
		      	   (pred_5 ?v3 ?v7)
			   (pred_1 ?v8 ?v5)
			   (pred_2 ?v5)
			   (pred_6 ?v3))
        :effect (and (not (pred_6 ?v3))(not (pred_2 ?v5)) (pred_4 ?v3)))
)