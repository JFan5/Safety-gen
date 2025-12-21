(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_4 type_1 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v3 - type_2 ?v7 - type_5)
	(pred_4 ?v3 - type_4 ?v1 - type_3)
	(pred_2 ?v1 - type_3)
	(pred_5 ?v2 - type_5 ?v5 - type_5)
	(pred_1 ?v8 - type_1)
	(pred_3 ?v8 - type_1))                                                                                           
(:action op_3 
        :parameters (?v4 - type_5 ?v6 - type_5 ?v3 - type_4)
        :precondition (and (pred_6 ?v3 ?v4) 
                           (pred_5 ?v4 ?v6))                                                          
        :effect (and (not (pred_6 ?v3 ?v4)) (pred_6 ?v3 ?v6)))

(:action op_2 
        :parameters (?v7 - type_5 ?v1 - type_3 ?v3 - type_4)
        :precondition (and (pred_6 ?v3 ?v7) 
                           (pred_6 ?v1 ?v7))
        :effect (and (not (pred_6 ?v1 ?v7))
                     (pred_4 ?v3 ?v1)))

(:action op_1 
        :parameters (?v7 - type_5 ?v1 - type_3 ?v3 - type_4 ?v8 - type_1)
        :precondition (and (pred_6 ?v3 ?v7) 
		      	   (pred_6 ?v8 ?v7)
			   (pred_4 ?v3 ?v1)
			   (pred_2 ?v1)
			   (pred_3 ?v8))
        :effect (and (not (pred_3 ?v8))(not (pred_2 ?v1)) (pred_1 ?v8)))
)