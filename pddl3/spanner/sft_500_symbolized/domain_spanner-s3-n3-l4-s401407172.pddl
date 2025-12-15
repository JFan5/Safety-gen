(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_4 - object
	type_5 type_1 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v6 - type_4 ?v4 - type_3)
	(pred_5 ?v6 - type_5 ?v1 - type_2)
	(pred_4 ?v1 - type_2)
	(pred_6 ?v5 - type_3 ?v7 - type_3)
	(pred_1 ?v2 - type_1)
	(pred_2 ?v2 - type_1))                                                                                           
(:action op_1 
        :parameters (?v3 - type_3 ?v8 - type_3 ?v6 - type_5)
        :precondition (and (pred_3 ?v6 ?v3) 
                           (pred_6 ?v3 ?v8))                                                          
        :effect (and (not (pred_3 ?v6 ?v3)) (pred_3 ?v6 ?v8)))

(:action op_2 
        :parameters (?v4 - type_3 ?v1 - type_2 ?v6 - type_5)
        :precondition (and (pred_3 ?v6 ?v4) 
                           (pred_3 ?v1 ?v4))
        :effect (and (not (pred_3 ?v1 ?v4))
                     (pred_5 ?v6 ?v1)))

(:action op_3 
        :parameters (?v4 - type_3 ?v1 - type_2 ?v6 - type_5 ?v2 - type_1)
        :precondition (and (pred_3 ?v6 ?v4) 
		      	   (pred_3 ?v2 ?v4)
			   (pred_5 ?v6 ?v1)
			   (pred_4 ?v1)
			   (pred_2 ?v2))
        :effect (and (not (pred_2 ?v2))(not (pred_4 ?v1)) (pred_1 ?v2)))
)