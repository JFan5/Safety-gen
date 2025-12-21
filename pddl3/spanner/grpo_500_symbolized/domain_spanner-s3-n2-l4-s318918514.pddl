(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_3 type_5 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v4 - type_1 ?v3 - type_4)
	(pred_3 ?v4 - type_3 ?v6 - type_2)
	(pred_1 ?v6 - type_2)
	(pred_4 ?v1 - type_4 ?v8 - type_4)
	(pred_2 ?v7 - type_5)
	(pred_5 ?v7 - type_5))                                                                                           
(:action op_3 
        :parameters (?v2 - type_4 ?v5 - type_4 ?v4 - type_3)
        :precondition (and (pred_6 ?v4 ?v2) 
                           (pred_4 ?v2 ?v5))                                                          
        :effect (and (not (pred_6 ?v4 ?v2)) (pred_6 ?v4 ?v5)))

(:action op_1 
        :parameters (?v3 - type_4 ?v6 - type_2 ?v4 - type_3)
        :precondition (and (pred_6 ?v4 ?v3) 
                           (pred_6 ?v6 ?v3))
        :effect (and (not (pred_6 ?v6 ?v3))
                     (pred_3 ?v4 ?v6)))

(:action op_2 
        :parameters (?v3 - type_4 ?v6 - type_2 ?v4 - type_3 ?v7 - type_5)
        :precondition (and (pred_6 ?v4 ?v3) 
		      	   (pred_6 ?v7 ?v3)
			   (pred_3 ?v4 ?v6)
			   (pred_1 ?v6)
			   (pred_5 ?v7))
        :effect (and (not (pred_5 ?v7))(not (pred_1 ?v6)) (pred_2 ?v7)))
)