(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_1 type_3 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_2 ?v3 - type_5)
	(pred_4 ?v8 - type_1 ?v1 - type_4)
	(pred_6 ?v1 - type_4)
	(pred_1 ?v2 - type_5 ?v7 - type_5)
	(pred_3 ?v5 - type_3)
	(pred_2 ?v5 - type_3))                                                                                           
(:action op_1 
        :parameters (?v6 - type_5 ?v4 - type_5 ?v8 - type_1)
        :precondition (and (pred_5 ?v8 ?v6) 
                           (pred_1 ?v6 ?v4))                                                          
        :effect (and (not (pred_5 ?v8 ?v6)) (pred_5 ?v8 ?v4)))

(:action op_2 
        :parameters (?v3 - type_5 ?v1 - type_4 ?v8 - type_1)
        :precondition (and (pred_5 ?v8 ?v3) 
                           (pred_5 ?v1 ?v3))
        :effect (and (not (pred_5 ?v1 ?v3))
                     (pred_4 ?v8 ?v1)))

(:action op_3 
        :parameters (?v3 - type_5 ?v1 - type_4 ?v8 - type_1 ?v5 - type_3)
        :precondition (and (pred_5 ?v8 ?v3) 
		      	   (pred_5 ?v5 ?v3)
			   (pred_4 ?v8 ?v1)
			   (pred_6 ?v1)
			   (pred_2 ?v5))
        :effect (and (not (pred_2 ?v5))(not (pred_6 ?v1)) (pred_3 ?v5)))
)