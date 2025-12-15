(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_2 type_5 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v6 - type_1 ?v4 - type_3)
	(pred_1 ?v6 - type_2 ?v1 - type_4)
	(pred_4 ?v1 - type_4)
	(pred_2 ?v3 - type_3 ?v5 - type_3)
	(pred_5 ?v8 - type_5)
	(pred_3 ?v8 - type_5))                                                                                           
(:action op_1 
        :parameters (?v7 - type_3 ?v2 - type_3 ?v6 - type_2)
        :precondition (and (pred_6 ?v6 ?v7) 
                           (pred_2 ?v7 ?v2))                                                          
        :effect (and (not (pred_6 ?v6 ?v7)) (pred_6 ?v6 ?v2)))

(:action op_2 
        :parameters (?v4 - type_3 ?v1 - type_4 ?v6 - type_2)
        :precondition (and (pred_6 ?v6 ?v4) 
                           (pred_6 ?v1 ?v4))
        :effect (and (not (pred_6 ?v1 ?v4))
                     (pred_1 ?v6 ?v1)))

(:action op_3 
        :parameters (?v4 - type_3 ?v1 - type_4 ?v6 - type_2 ?v8 - type_5)
        :precondition (and (pred_6 ?v6 ?v4) 
		      	   (pred_6 ?v8 ?v4)
			   (pred_1 ?v6 ?v1)
			   (pred_4 ?v1)
			   (pred_3 ?v8))
        :effect (and (not (pred_3 ?v8))(not (pred_4 ?v1)) (pred_5 ?v8)))
)