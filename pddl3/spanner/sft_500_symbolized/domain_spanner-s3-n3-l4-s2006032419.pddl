(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_3 type_4 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_1 ?v7 - type_5)
	(pred_4 ?v6 - type_3 ?v2 - type_2)
	(pred_3 ?v2 - type_2)
	(pred_6 ?v8 - type_5 ?v3 - type_5)
	(pred_2 ?v5 - type_4)
	(pred_1 ?v5 - type_4))                                                                                           
(:action op_3 
        :parameters (?v1 - type_5 ?v4 - type_5 ?v6 - type_3)
        :precondition (and (pred_5 ?v6 ?v1) 
                           (pred_6 ?v1 ?v4))                                                          
        :effect (and (not (pred_5 ?v6 ?v1)) (pred_5 ?v6 ?v4)))

(:action op_1 
        :parameters (?v7 - type_5 ?v2 - type_2 ?v6 - type_3)
        :precondition (and (pred_5 ?v6 ?v7) 
                           (pred_5 ?v2 ?v7))
        :effect (and (not (pred_5 ?v2 ?v7))
                     (pred_4 ?v6 ?v2)))

(:action op_2 
        :parameters (?v7 - type_5 ?v2 - type_2 ?v6 - type_3 ?v5 - type_4)
        :precondition (and (pred_5 ?v6 ?v7) 
		      	   (pred_5 ?v5 ?v7)
			   (pred_4 ?v6 ?v2)
			   (pred_3 ?v2)
			   (pred_1 ?v5))
        :effect (and (not (pred_1 ?v5))(not (pred_3 ?v2)) (pred_2 ?v5)))
)