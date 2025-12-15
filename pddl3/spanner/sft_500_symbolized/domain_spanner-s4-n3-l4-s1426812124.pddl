(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_3 type_2 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v4 - type_5 ?v3 - type_4)
	(pred_6 ?v4 - type_3 ?v6 - type_1)
	(pred_3 ?v6 - type_1)
	(pred_2 ?v2 - type_4 ?v5 - type_4)
	(pred_4 ?v7 - type_2)
	(pred_5 ?v7 - type_2))                                                                                           
(:action op_3 
        :parameters (?v8 - type_4 ?v1 - type_4 ?v4 - type_3)
        :precondition (and (pred_1 ?v4 ?v8) 
                           (pred_2 ?v8 ?v1))                                                          
        :effect (and (not (pred_1 ?v4 ?v8)) (pred_1 ?v4 ?v1)))

(:action op_2 
        :parameters (?v3 - type_4 ?v6 - type_1 ?v4 - type_3)
        :precondition (and (pred_1 ?v4 ?v3) 
                           (pred_1 ?v6 ?v3))
        :effect (and (not (pred_1 ?v6 ?v3))
                     (pred_6 ?v4 ?v6)))

(:action op_1 
        :parameters (?v3 - type_4 ?v6 - type_1 ?v4 - type_3 ?v7 - type_2)
        :precondition (and (pred_1 ?v4 ?v3) 
		      	   (pred_1 ?v7 ?v3)
			   (pred_6 ?v4 ?v6)
			   (pred_3 ?v6)
			   (pred_5 ?v7))
        :effect (and (not (pred_5 ?v7))(not (pred_3 ?v6)) (pred_4 ?v7)))
)