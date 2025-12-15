(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_3 - object
	type_4 type_5 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_3 ?v4 - type_2)
	(pred_6 ?v6 - type_4 ?v3 - type_1)
	(pred_1 ?v3 - type_1)
	(pred_4 ?v2 - type_2 ?v5 - type_2)
	(pred_2 ?v1 - type_5)
	(pred_3 ?v1 - type_5))                                                                                           
(:action op_1 
        :parameters (?v8 - type_2 ?v7 - type_2 ?v6 - type_4)
        :precondition (and (pred_5 ?v6 ?v8) 
                           (pred_4 ?v8 ?v7))                                                          
        :effect (and (not (pred_5 ?v6 ?v8)) (pred_5 ?v6 ?v7)))

(:action op_2 
        :parameters (?v4 - type_2 ?v3 - type_1 ?v6 - type_4)
        :precondition (and (pred_5 ?v6 ?v4) 
                           (pred_5 ?v3 ?v4))
        :effect (and (not (pred_5 ?v3 ?v4))
                     (pred_6 ?v6 ?v3)))

(:action op_3 
        :parameters (?v4 - type_2 ?v3 - type_1 ?v6 - type_4 ?v1 - type_5)
        :precondition (and (pred_5 ?v6 ?v4) 
		      	   (pred_5 ?v1 ?v4)
			   (pred_6 ?v6 ?v3)
			   (pred_1 ?v3)
			   (pred_3 ?v1))
        :effect (and (not (pred_3 ?v1))(not (pred_1 ?v3)) (pred_2 ?v1)))
)