(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_4 type_5 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v3 - type_2 ?v1 - type_3)
	(pred_3 ?v3 - type_4 ?v8 - type_1)
	(pred_1 ?v8 - type_1)
	(pred_4 ?v2 - type_3 ?v7 - type_3)
	(pred_6 ?v4 - type_5)
	(pred_5 ?v4 - type_5))                                                                                           
(:action op_1 
        :parameters (?v6 - type_3 ?v5 - type_3 ?v3 - type_4)
        :precondition (and (pred_2 ?v3 ?v6) 
                           (pred_4 ?v6 ?v5))                                                          
        :effect (and (not (pred_2 ?v3 ?v6)) (pred_2 ?v3 ?v5)))

(:action op_2 
        :parameters (?v1 - type_3 ?v8 - type_1 ?v3 - type_4)
        :precondition (and (pred_2 ?v3 ?v1) 
                           (pred_2 ?v8 ?v1))
        :effect (and (not (pred_2 ?v8 ?v1))
                     (pred_3 ?v3 ?v8)))

(:action op_3 
        :parameters (?v1 - type_3 ?v8 - type_1 ?v3 - type_4 ?v4 - type_5)
        :precondition (and (pred_2 ?v3 ?v1) 
		      	   (pred_2 ?v4 ?v1)
			   (pred_3 ?v3 ?v8)
			   (pred_1 ?v8)
			   (pred_5 ?v4))
        :effect (and (not (pred_5 ?v4))(not (pred_1 ?v8)) (pred_6 ?v4)))
)