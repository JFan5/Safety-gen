(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_4 type_2 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v3 - type_1 ?v2 - type_3)
	(pred_5 ?v3 - type_4 ?v6 - type_5)
	(pred_2 ?v6 - type_5)
	(pred_6 ?v1 - type_3 ?v8 - type_3)
	(pred_3 ?v4 - type_2)
	(pred_1 ?v4 - type_2))                                                                                           
(:action op_2 
        :parameters (?v5 - type_3 ?v7 - type_3 ?v3 - type_4)
        :precondition (and (pred_4 ?v3 ?v5) 
                           (pred_6 ?v5 ?v7))                                                          
        :effect (and (not (pred_4 ?v3 ?v5)) (pred_4 ?v3 ?v7)))

(:action op_1 
        :parameters (?v2 - type_3 ?v6 - type_5 ?v3 - type_4)
        :precondition (and (pred_4 ?v3 ?v2) 
                           (pred_4 ?v6 ?v2))
        :effect (and (not (pred_4 ?v6 ?v2))
                     (pred_5 ?v3 ?v6)))

(:action op_3 
        :parameters (?v2 - type_3 ?v6 - type_5 ?v3 - type_4 ?v4 - type_2)
        :precondition (and (pred_4 ?v3 ?v2) 
		      	   (pred_4 ?v4 ?v2)
			   (pred_5 ?v3 ?v6)
			   (pred_2 ?v6)
			   (pred_1 ?v4))
        :effect (and (not (pred_1 ?v4))(not (pred_2 ?v6)) (pred_3 ?v4)))
)