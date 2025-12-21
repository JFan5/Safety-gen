(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_4 type_5 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v6 - type_1 ?v3 - type_2)
	(pred_4 ?v6 - type_4 ?v1 - type_3)
	(pred_5 ?v1 - type_3)
	(pred_2 ?v2 - type_2 ?v5 - type_2)
	(pred_6 ?v4 - type_5)
	(pred_1 ?v4 - type_5))                                                                                           
(:action op_1 
        :parameters (?v7 - type_2 ?v8 - type_2 ?v6 - type_4)
        :precondition (and (pred_3 ?v6 ?v7) 
                           (pred_2 ?v7 ?v8))                                                          
        :effect (and (not (pred_3 ?v6 ?v7)) (pred_3 ?v6 ?v8)))

(:action op_2 
        :parameters (?v3 - type_2 ?v1 - type_3 ?v6 - type_4)
        :precondition (and (pred_3 ?v6 ?v3) 
                           (pred_3 ?v1 ?v3))
        :effect (and (not (pred_3 ?v1 ?v3))
                     (pred_4 ?v6 ?v1)))

(:action op_3 
        :parameters (?v3 - type_2 ?v1 - type_3 ?v6 - type_4 ?v4 - type_5)
        :precondition (and (pred_3 ?v6 ?v3) 
		      	   (pred_3 ?v4 ?v3)
			   (pred_4 ?v6 ?v1)
			   (pred_5 ?v1)
			   (pred_1 ?v4))
        :effect (and (not (pred_1 ?v4))(not (pred_5 ?v1)) (pred_6 ?v4)))
)