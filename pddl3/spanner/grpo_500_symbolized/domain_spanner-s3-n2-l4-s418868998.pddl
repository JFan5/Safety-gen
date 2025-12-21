(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_4 type_3 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v1 - type_1 ?v3 - type_2)
	(pred_5 ?v1 - type_4 ?v6 - type_5)
	(pred_6 ?v6 - type_5)
	(pred_1 ?v8 - type_2 ?v2 - type_2)
	(pred_2 ?v4 - type_3)
	(pred_3 ?v4 - type_3))                                                                                           
(:action op_2 
        :parameters (?v7 - type_2 ?v5 - type_2 ?v1 - type_4)
        :precondition (and (pred_4 ?v1 ?v7) 
                           (pred_1 ?v7 ?v5))                                                          
        :effect (and (not (pred_4 ?v1 ?v7)) (pred_4 ?v1 ?v5)))

(:action op_3 
        :parameters (?v3 - type_2 ?v6 - type_5 ?v1 - type_4)
        :precondition (and (pred_4 ?v1 ?v3) 
                           (pred_4 ?v6 ?v3))
        :effect (and (not (pred_4 ?v6 ?v3))
                     (pred_5 ?v1 ?v6)))

(:action op_1 
        :parameters (?v3 - type_2 ?v6 - type_5 ?v1 - type_4 ?v4 - type_3)
        :precondition (and (pred_4 ?v1 ?v3) 
		      	   (pred_4 ?v4 ?v3)
			   (pred_5 ?v1 ?v6)
			   (pred_6 ?v6)
			   (pred_3 ?v4))
        :effect (and (not (pred_3 ?v4))(not (pred_6 ?v6)) (pred_2 ?v4)))
)