(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_4 - object
	type_5 type_2 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v8 - type_4 ?v3 - type_1)
	(pred_5 ?v8 - type_5 ?v6 - type_3)
	(pred_6 ?v6 - type_3)
	(pred_3 ?v4 - type_1 ?v5 - type_1)
	(pred_2 ?v1 - type_2)
	(pred_1 ?v1 - type_2))                                                                                           
(:action op_3 
        :parameters (?v7 - type_1 ?v2 - type_1 ?v8 - type_5)
        :precondition (and (pred_4 ?v8 ?v7) 
                           (pred_3 ?v7 ?v2))                                                          
        :effect (and (not (pred_4 ?v8 ?v7)) (pred_4 ?v8 ?v2)))

(:action op_2 
        :parameters (?v3 - type_1 ?v6 - type_3 ?v8 - type_5)
        :precondition (and (pred_4 ?v8 ?v3) 
                           (pred_4 ?v6 ?v3))
        :effect (and (not (pred_4 ?v6 ?v3))
                     (pred_5 ?v8 ?v6)))

(:action op_1 
        :parameters (?v3 - type_1 ?v6 - type_3 ?v8 - type_5 ?v1 - type_2)
        :precondition (and (pred_4 ?v8 ?v3) 
		      	   (pred_4 ?v1 ?v3)
			   (pred_5 ?v8 ?v6)
			   (pred_6 ?v6)
			   (pred_1 ?v1))
        :effect (and (not (pred_1 ?v1))(not (pred_6 ?v6)) (pred_2 ?v1)))
)