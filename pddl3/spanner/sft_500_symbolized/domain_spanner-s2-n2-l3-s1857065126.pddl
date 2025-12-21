(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_5 type_2 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v6 - type_1 ?v5 - type_3)
	(pred_5 ?v6 - type_5 ?v2 - type_4)
	(pred_2 ?v2 - type_4)
	(pred_3 ?v8 - type_3 ?v7 - type_3)
	(pred_6 ?v4 - type_2)
	(pred_4 ?v4 - type_2))                                                                                           
(:action op_3 
        :parameters (?v3 - type_3 ?v1 - type_3 ?v6 - type_5)
        :precondition (and (pred_1 ?v6 ?v3) 
                           (pred_3 ?v3 ?v1))                                                          
        :effect (and (not (pred_1 ?v6 ?v3)) (pred_1 ?v6 ?v1)))

(:action op_2 
        :parameters (?v5 - type_3 ?v2 - type_4 ?v6 - type_5)
        :precondition (and (pred_1 ?v6 ?v5) 
                           (pred_1 ?v2 ?v5))
        :effect (and (not (pred_1 ?v2 ?v5))
                     (pred_5 ?v6 ?v2)))

(:action op_1 
        :parameters (?v5 - type_3 ?v2 - type_4 ?v6 - type_5 ?v4 - type_2)
        :precondition (and (pred_1 ?v6 ?v5) 
		      	   (pred_1 ?v4 ?v5)
			   (pred_5 ?v6 ?v2)
			   (pred_2 ?v2)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_2 ?v2)) (pred_6 ?v4)))
)