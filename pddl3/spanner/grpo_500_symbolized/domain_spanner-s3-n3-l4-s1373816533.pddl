(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_3 type_2 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v8 - type_1 ?v7 - type_4)
	(pred_5 ?v8 - type_3 ?v1 - type_5)
	(pred_4 ?v1 - type_5)
	(pred_1 ?v3 - type_4 ?v4 - type_4)
	(pred_2 ?v2 - type_2)
	(pred_6 ?v2 - type_2))                                                                                           
(:action op_1 
        :parameters (?v5 - type_4 ?v6 - type_4 ?v8 - type_3)
        :precondition (and (pred_3 ?v8 ?v5) 
                           (pred_1 ?v5 ?v6))                                                          
        :effect (and (not (pred_3 ?v8 ?v5)) (pred_3 ?v8 ?v6)))

(:action op_2 
        :parameters (?v7 - type_4 ?v1 - type_5 ?v8 - type_3)
        :precondition (and (pred_3 ?v8 ?v7) 
                           (pred_3 ?v1 ?v7))
        :effect (and (not (pred_3 ?v1 ?v7))
                     (pred_5 ?v8 ?v1)))

(:action op_3 
        :parameters (?v7 - type_4 ?v1 - type_5 ?v8 - type_3 ?v2 - type_2)
        :precondition (and (pred_3 ?v8 ?v7) 
		      	   (pred_3 ?v2 ?v7)
			   (pred_5 ?v8 ?v1)
			   (pred_4 ?v1)
			   (pred_6 ?v2))
        :effect (and (not (pred_6 ?v2))(not (pred_4 ?v1)) (pred_2 ?v2)))
)