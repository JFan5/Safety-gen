(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_5 type_1 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v8 - type_2 ?v2 - type_3)
	(pred_4 ?v8 - type_5 ?v6 - type_4)
	(pred_5 ?v6 - type_4)
	(pred_1 ?v7 - type_3 ?v5 - type_3)
	(pred_3 ?v4 - type_1)
	(pred_6 ?v4 - type_1))                                                                                           
(:action op_1 
        :parameters (?v1 - type_3 ?v3 - type_3 ?v8 - type_5)
        :precondition (and (pred_2 ?v8 ?v1) 
                           (pred_1 ?v1 ?v3))                                                          
        :effect (and (not (pred_2 ?v8 ?v1)) (pred_2 ?v8 ?v3)))

(:action op_3 
        :parameters (?v2 - type_3 ?v6 - type_4 ?v8 - type_5)
        :precondition (and (pred_2 ?v8 ?v2) 
                           (pred_2 ?v6 ?v2))
        :effect (and (not (pred_2 ?v6 ?v2))
                     (pred_4 ?v8 ?v6)))

(:action op_2 
        :parameters (?v2 - type_3 ?v6 - type_4 ?v8 - type_5 ?v4 - type_1)
        :precondition (and (pred_2 ?v8 ?v2) 
		      	   (pred_2 ?v4 ?v2)
			   (pred_4 ?v8 ?v6)
			   (pred_5 ?v6)
			   (pred_6 ?v4))
        :effect (and (not (pred_6 ?v4))(not (pred_5 ?v6)) (pred_3 ?v4)))
)