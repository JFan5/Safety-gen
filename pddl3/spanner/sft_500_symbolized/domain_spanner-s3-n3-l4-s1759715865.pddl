(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_4 type_5 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v4 - type_2 ?v5 - type_1)
	(pred_5 ?v4 - type_4 ?v3 - type_3)
	(pred_1 ?v3 - type_3)
	(pred_4 ?v7 - type_1 ?v1 - type_1)
	(pred_6 ?v6 - type_5)
	(pred_3 ?v6 - type_5))                                                                                           
(:action op_3 
        :parameters (?v2 - type_1 ?v8 - type_1 ?v4 - type_4)
        :precondition (and (pred_2 ?v4 ?v2) 
                           (pred_4 ?v2 ?v8))                                                          
        :effect (and (not (pred_2 ?v4 ?v2)) (pred_2 ?v4 ?v8)))

(:action op_1 
        :parameters (?v5 - type_1 ?v3 - type_3 ?v4 - type_4)
        :precondition (and (pred_2 ?v4 ?v5) 
                           (pred_2 ?v3 ?v5))
        :effect (and (not (pred_2 ?v3 ?v5))
                     (pred_5 ?v4 ?v3)))

(:action op_2 
        :parameters (?v5 - type_1 ?v3 - type_3 ?v4 - type_4 ?v6 - type_5)
        :precondition (and (pred_2 ?v4 ?v5) 
		      	   (pred_2 ?v6 ?v5)
			   (pred_5 ?v4 ?v3)
			   (pred_1 ?v3)
			   (pred_3 ?v6))
        :effect (and (not (pred_3 ?v6))(not (pred_1 ?v3)) (pred_6 ?v6)))
)