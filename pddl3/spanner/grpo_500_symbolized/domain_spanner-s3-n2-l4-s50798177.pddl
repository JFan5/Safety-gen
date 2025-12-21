(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_2 type_5 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_1 ?v5 - type_3)
	(pred_2 ?v6 - type_2 ?v3 - type_4)
	(pred_1 ?v3 - type_4)
	(pred_3 ?v2 - type_3 ?v7 - type_3)
	(pred_4 ?v1 - type_5)
	(pred_6 ?v1 - type_5))                                                                                           
(:action op_2 
        :parameters (?v4 - type_3 ?v8 - type_3 ?v6 - type_2)
        :precondition (and (pred_5 ?v6 ?v4) 
                           (pred_3 ?v4 ?v8))                                                          
        :effect (and (not (pred_5 ?v6 ?v4)) (pred_5 ?v6 ?v8)))

(:action op_3 
        :parameters (?v5 - type_3 ?v3 - type_4 ?v6 - type_2)
        :precondition (and (pred_5 ?v6 ?v5) 
                           (pred_5 ?v3 ?v5))
        :effect (and (not (pred_5 ?v3 ?v5))
                     (pred_2 ?v6 ?v3)))

(:action op_1 
        :parameters (?v5 - type_3 ?v3 - type_4 ?v6 - type_2 ?v1 - type_5)
        :precondition (and (pred_5 ?v6 ?v5) 
		      	   (pred_5 ?v1 ?v5)
			   (pred_2 ?v6 ?v3)
			   (pred_1 ?v3)
			   (pred_6 ?v1))
        :effect (and (not (pred_6 ?v1))(not (pred_1 ?v3)) (pred_4 ?v1)))
)