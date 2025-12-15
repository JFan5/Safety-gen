(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_4 type_3 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_1 ?v1 - type_5)
	(pred_1 ?v4 - type_4 ?v5 - type_2)
	(pred_6 ?v5 - type_2)
	(pred_5 ?v7 - type_5 ?v3 - type_5)
	(pred_4 ?v6 - type_3)
	(pred_3 ?v6 - type_3))                                                                                           
(:action op_2 
        :parameters (?v2 - type_5 ?v8 - type_5 ?v4 - type_4)
        :precondition (and (pred_2 ?v4 ?v2) 
                           (pred_5 ?v2 ?v8))                                                          
        :effect (and (not (pred_2 ?v4 ?v2)) (pred_2 ?v4 ?v8)))

(:action op_3 
        :parameters (?v1 - type_5 ?v5 - type_2 ?v4 - type_4)
        :precondition (and (pred_2 ?v4 ?v1) 
                           (pred_2 ?v5 ?v1))
        :effect (and (not (pred_2 ?v5 ?v1))
                     (pred_1 ?v4 ?v5)))

(:action op_1 
        :parameters (?v1 - type_5 ?v5 - type_2 ?v4 - type_4 ?v6 - type_3)
        :precondition (and (pred_2 ?v4 ?v1) 
		      	   (pred_2 ?v6 ?v1)
			   (pred_1 ?v4 ?v5)
			   (pred_6 ?v5)
			   (pred_3 ?v6))
        :effect (and (not (pred_3 ?v6))(not (pred_6 ?v5)) (pred_4 ?v6)))
)