(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_2 - object
	type_1 type_3 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_2 ?v2 - type_5)
	(pred_2 ?v8 - type_1 ?v3 - type_4)
	(pred_1 ?v3 - type_4)
	(pred_6 ?v4 - type_5 ?v7 - type_5)
	(pred_3 ?v1 - type_3)
	(pred_4 ?v1 - type_3))                                                                                           
(:action op_3 
        :parameters (?v5 - type_5 ?v6 - type_5 ?v8 - type_1)
        :precondition (and (pred_5 ?v8 ?v5) 
                           (pred_6 ?v5 ?v6))                                                          
        :effect (and (not (pred_5 ?v8 ?v5)) (pred_5 ?v8 ?v6)))

(:action op_2 
        :parameters (?v2 - type_5 ?v3 - type_4 ?v8 - type_1)
        :precondition (and (pred_5 ?v8 ?v2) 
                           (pred_5 ?v3 ?v2))
        :effect (and (not (pred_5 ?v3 ?v2))
                     (pred_2 ?v8 ?v3)))

(:action op_1 
        :parameters (?v2 - type_5 ?v3 - type_4 ?v8 - type_1 ?v1 - type_3)
        :precondition (and (pred_5 ?v8 ?v2) 
		      	   (pred_5 ?v1 ?v2)
			   (pred_2 ?v8 ?v3)
			   (pred_1 ?v3)
			   (pred_4 ?v1))
        :effect (and (not (pred_4 ?v1))(not (pred_1 ?v3)) (pred_3 ?v1)))
)