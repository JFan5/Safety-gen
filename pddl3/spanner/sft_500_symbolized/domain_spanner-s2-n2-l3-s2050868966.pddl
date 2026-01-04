(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_4 type_5 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v5 - type_1 ?v7 - type_3)
	(pred_5 ?v5 - type_4 ?v1 - type_2)
	(pred_1 ?v1 - type_2)
	(pred_3 ?v4 - type_3 ?v3 - type_3)
	(pred_2 ?v6 - type_5)
	(pred_6 ?v6 - type_5))                                                                                           
(:action op_1 
        :parameters (?v8 - type_3 ?v2 - type_3 ?v5 - type_4)
        :precondition (and (pred_4 ?v5 ?v8) 
                           (pred_3 ?v8 ?v2))                                                          
        :effect (and (not (pred_4 ?v5 ?v8)) (pred_4 ?v5 ?v2)))

(:action op_2 
        :parameters (?v7 - type_3 ?v1 - type_2 ?v5 - type_4)
        :precondition (and (pred_4 ?v5 ?v7) 
                           (pred_4 ?v1 ?v7))
        :effect (and (not (pred_4 ?v1 ?v7))
                     (pred_5 ?v5 ?v1)))

(:action op_3 
        :parameters (?v7 - type_3 ?v1 - type_2 ?v5 - type_4 ?v6 - type_5)
        :precondition (and (pred_4 ?v5 ?v7) 
		      	   (pred_4 ?v6 ?v7)
			   (pred_5 ?v5 ?v1)
			   (pred_1 ?v1)
			   (pred_6 ?v6))
        :effect (and (not (pred_6 ?v6))(not (pred_1 ?v1)) (pred_2 ?v6)))
)