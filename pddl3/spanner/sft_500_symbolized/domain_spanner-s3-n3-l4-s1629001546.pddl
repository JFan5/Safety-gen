(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_4 type_3 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v8 - type_5 ?v5 - type_2)
	(pred_3 ?v8 - type_4 ?v6 - type_1)
	(pred_4 ?v6 - type_1)
	(pred_1 ?v7 - type_2 ?v1 - type_2)
	(pred_5 ?v4 - type_3)
	(pred_6 ?v4 - type_3))                                                                                           
(:action op_1 
        :parameters (?v2 - type_2 ?v3 - type_2 ?v8 - type_4)
        :precondition (and (pred_2 ?v8 ?v2) 
                           (pred_1 ?v2 ?v3))                                                          
        :effect (and (not (pred_2 ?v8 ?v2)) (pred_2 ?v8 ?v3)))

(:action op_3 
        :parameters (?v5 - type_2 ?v6 - type_1 ?v8 - type_4)
        :precondition (and (pred_2 ?v8 ?v5) 
                           (pred_2 ?v6 ?v5))
        :effect (and (not (pred_2 ?v6 ?v5))
                     (pred_3 ?v8 ?v6)))

(:action op_2 
        :parameters (?v5 - type_2 ?v6 - type_1 ?v8 - type_4 ?v4 - type_3)
        :precondition (and (pred_2 ?v8 ?v5) 
		      	   (pred_2 ?v4 ?v5)
			   (pred_3 ?v8 ?v6)
			   (pred_4 ?v6)
			   (pred_6 ?v4))
        :effect (and (not (pred_6 ?v4))(not (pred_4 ?v6)) (pred_5 ?v4)))
)