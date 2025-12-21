(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_4 type_3 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v8 - type_2 ?v4 - type_5)
	(pred_2 ?v8 - type_4 ?v3 - type_1)
	(pred_1 ?v3 - type_1)
	(pred_6 ?v5 - type_5 ?v7 - type_5)
	(pred_5 ?v2 - type_3)
	(pred_3 ?v2 - type_3))                                                                                           
(:action op_1 
        :parameters (?v1 - type_5 ?v6 - type_5 ?v8 - type_4)
        :precondition (and (pred_4 ?v8 ?v1) 
                           (pred_6 ?v1 ?v6))                                                          
        :effect (and (not (pred_4 ?v8 ?v1)) (pred_4 ?v8 ?v6)))

(:action op_3 
        :parameters (?v4 - type_5 ?v3 - type_1 ?v8 - type_4)
        :precondition (and (pred_4 ?v8 ?v4) 
                           (pred_4 ?v3 ?v4))
        :effect (and (not (pred_4 ?v3 ?v4))
                     (pred_2 ?v8 ?v3)))

(:action op_2 
        :parameters (?v4 - type_5 ?v3 - type_1 ?v8 - type_4 ?v2 - type_3)
        :precondition (and (pred_4 ?v8 ?v4) 
		      	   (pred_4 ?v2 ?v4)
			   (pred_2 ?v8 ?v3)
			   (pred_1 ?v3)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_1 ?v3)) (pred_5 ?v2)))
)