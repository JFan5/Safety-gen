(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_1 type_5 type_3 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_4 ?v4 - type_2)
	(pred_2 ?v6 - type_1 ?v8 - type_3)
	(pred_6 ?v8 - type_3)
	(pred_3 ?v3 - type_2 ?v7 - type_2)
	(pred_1 ?v1 - type_5)
	(pred_4 ?v1 - type_5))                                                                                           
(:action op_1 
        :parameters (?v5 - type_2 ?v2 - type_2 ?v6 - type_1)
        :precondition (and (pred_5 ?v6 ?v5) 
                           (pred_3 ?v5 ?v2))                                                          
        :effect (and (not (pred_5 ?v6 ?v5)) (pred_5 ?v6 ?v2)))

(:action op_3 
        :parameters (?v4 - type_2 ?v8 - type_3 ?v6 - type_1)
        :precondition (and (pred_5 ?v6 ?v4) 
                           (pred_5 ?v8 ?v4))
        :effect (and (not (pred_5 ?v8 ?v4))
                     (pred_2 ?v6 ?v8)))

(:action op_2 
        :parameters (?v4 - type_2 ?v8 - type_3 ?v6 - type_1 ?v1 - type_5)
        :precondition (and (pred_5 ?v6 ?v4) 
		      	   (pred_5 ?v1 ?v4)
			   (pred_2 ?v6 ?v8)
			   (pred_6 ?v8)
			   (pred_4 ?v1))
        :effect (and (not (pred_4 ?v1))(not (pred_6 ?v8)) (pred_1 ?v1)))
)