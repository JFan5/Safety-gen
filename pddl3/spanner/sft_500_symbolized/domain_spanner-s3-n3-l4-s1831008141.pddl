(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_3 type_2 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v1 - type_1 ?v4 - type_5)
	(pred_1 ?v1 - type_3 ?v3 - type_4)
	(pred_3 ?v3 - type_4)
	(pred_5 ?v2 - type_5 ?v5 - type_5)
	(pred_2 ?v6 - type_2)
	(pred_4 ?v6 - type_2))                                                                                           
(:action op_1 
        :parameters (?v7 - type_5 ?v8 - type_5 ?v1 - type_3)
        :precondition (and (pred_6 ?v1 ?v7) 
                           (pred_5 ?v7 ?v8))                                                          
        :effect (and (not (pred_6 ?v1 ?v7)) (pred_6 ?v1 ?v8)))

(:action op_2 
        :parameters (?v4 - type_5 ?v3 - type_4 ?v1 - type_3)
        :precondition (and (pred_6 ?v1 ?v4) 
                           (pred_6 ?v3 ?v4))
        :effect (and (not (pred_6 ?v3 ?v4))
                     (pred_1 ?v1 ?v3)))

(:action op_3 
        :parameters (?v4 - type_5 ?v3 - type_4 ?v1 - type_3 ?v6 - type_2)
        :precondition (and (pred_6 ?v1 ?v4) 
		      	   (pred_6 ?v6 ?v4)
			   (pred_1 ?v1 ?v3)
			   (pred_3 ?v3)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_3 ?v3)) (pred_2 ?v6)))
)