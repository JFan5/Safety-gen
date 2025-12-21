(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_2 type_1 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v8 - type_5 ?v1 - type_3)
	(pred_6 ?v8 - type_2 ?v6 - type_4)
	(pred_2 ?v6 - type_4)
	(pred_4 ?v3 - type_3 ?v7 - type_3)
	(pred_5 ?v2 - type_1)
	(pred_3 ?v2 - type_1))                                                                                           
(:action op_3 
        :parameters (?v4 - type_3 ?v5 - type_3 ?v8 - type_2)
        :precondition (and (pred_1 ?v8 ?v4) 
                           (pred_4 ?v4 ?v5))                                                          
        :effect (and (not (pred_1 ?v8 ?v4)) (pred_1 ?v8 ?v5)))

(:action op_2 
        :parameters (?v1 - type_3 ?v6 - type_4 ?v8 - type_2)
        :precondition (and (pred_1 ?v8 ?v1) 
                           (pred_1 ?v6 ?v1))
        :effect (and (not (pred_1 ?v6 ?v1))
                     (pred_6 ?v8 ?v6)))

(:action op_1 
        :parameters (?v1 - type_3 ?v6 - type_4 ?v8 - type_2 ?v2 - type_1)
        :precondition (and (pred_1 ?v8 ?v1) 
		      	   (pred_1 ?v2 ?v1)
			   (pred_6 ?v8 ?v6)
			   (pred_2 ?v6)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_2 ?v6)) (pred_5 ?v2)))
)