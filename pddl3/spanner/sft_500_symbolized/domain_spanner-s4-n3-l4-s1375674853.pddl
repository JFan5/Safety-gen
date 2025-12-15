(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_5 type_4 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v1 - type_1 ?v4 - type_3)
	(pred_1 ?v1 - type_5 ?v2 - type_2)
	(pred_6 ?v2 - type_2)
	(pred_2 ?v7 - type_3 ?v6 - type_3)
	(pred_3 ?v8 - type_4)
	(pred_4 ?v8 - type_4))                                                                                           
(:action op_1 
        :parameters (?v3 - type_3 ?v5 - type_3 ?v1 - type_5)
        :precondition (and (pred_5 ?v1 ?v3) 
                           (pred_2 ?v3 ?v5))                                                          
        :effect (and (not (pred_5 ?v1 ?v3)) (pred_5 ?v1 ?v5)))

(:action op_2 
        :parameters (?v4 - type_3 ?v2 - type_2 ?v1 - type_5)
        :precondition (and (pred_5 ?v1 ?v4) 
                           (pred_5 ?v2 ?v4))
        :effect (and (not (pred_5 ?v2 ?v4))
                     (pred_1 ?v1 ?v2)))

(:action op_3 
        :parameters (?v4 - type_3 ?v2 - type_2 ?v1 - type_5 ?v8 - type_4)
        :precondition (and (pred_5 ?v1 ?v4) 
		      	   (pred_5 ?v8 ?v4)
			   (pred_1 ?v1 ?v2)
			   (pred_6 ?v2)
			   (pred_4 ?v8))
        :effect (and (not (pred_4 ?v8))(not (pred_6 ?v2)) (pred_3 ?v8)))
)