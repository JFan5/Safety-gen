(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_5 type_4 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_2 ?v3 - type_3)
	(pred_4 ?v4 - type_5 ?v8 - type_1)
	(pred_5 ?v8 - type_1)
	(pred_1 ?v7 - type_3 ?v5 - type_3)
	(pred_6 ?v2 - type_4)
	(pred_3 ?v2 - type_4))                                                                                           
(:action op_2 
        :parameters (?v6 - type_3 ?v1 - type_3 ?v4 - type_5)
        :precondition (and (pred_2 ?v4 ?v6) 
                           (pred_1 ?v6 ?v1))                                                          
        :effect (and (not (pred_2 ?v4 ?v6)) (pred_2 ?v4 ?v1)))

(:action op_1 
        :parameters (?v3 - type_3 ?v8 - type_1 ?v4 - type_5)
        :precondition (and (pred_2 ?v4 ?v3) 
                           (pred_2 ?v8 ?v3))
        :effect (and (not (pred_2 ?v8 ?v3))
                     (pred_4 ?v4 ?v8)))

(:action op_3 
        :parameters (?v3 - type_3 ?v8 - type_1 ?v4 - type_5 ?v2 - type_4)
        :precondition (and (pred_2 ?v4 ?v3) 
		      	   (pred_2 ?v2 ?v3)
			   (pred_4 ?v4 ?v8)
			   (pred_5 ?v8)
			   (pred_3 ?v2))
        :effect (and (not (pred_3 ?v2))(not (pred_5 ?v8)) (pred_6 ?v2)))
)