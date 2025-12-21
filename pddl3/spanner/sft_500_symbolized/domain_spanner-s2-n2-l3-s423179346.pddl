(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_2 type_3 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v6 - type_1 ?v3 - type_4)
	(pred_2 ?v6 - type_2 ?v4 - type_5)
	(pred_1 ?v4 - type_5)
	(pred_6 ?v2 - type_4 ?v7 - type_4)
	(pred_5 ?v5 - type_3)
	(pred_4 ?v5 - type_3))                                                                                           
(:action op_3 
        :parameters (?v1 - type_4 ?v8 - type_4 ?v6 - type_2)
        :precondition (and (pred_3 ?v6 ?v1) 
                           (pred_6 ?v1 ?v8))                                                          
        :effect (and (not (pred_3 ?v6 ?v1)) (pred_3 ?v6 ?v8)))

(:action op_1 
        :parameters (?v3 - type_4 ?v4 - type_5 ?v6 - type_2)
        :precondition (and (pred_3 ?v6 ?v3) 
                           (pred_3 ?v4 ?v3))
        :effect (and (not (pred_3 ?v4 ?v3))
                     (pred_2 ?v6 ?v4)))

(:action op_2 
        :parameters (?v3 - type_4 ?v4 - type_5 ?v6 - type_2 ?v5 - type_3)
        :precondition (and (pred_3 ?v6 ?v3) 
		      	   (pred_3 ?v5 ?v3)
			   (pred_2 ?v6 ?v4)
			   (pred_1 ?v4)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_1 ?v4)) (pred_5 ?v5)))
)