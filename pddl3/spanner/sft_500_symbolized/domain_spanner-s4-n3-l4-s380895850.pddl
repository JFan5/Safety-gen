(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_1 type_3 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v7 - type_2 ?v1 - type_4)
	(pred_1 ?v7 - type_1 ?v6 - type_5)
	(pred_2 ?v6 - type_5)
	(pred_5 ?v8 - type_4 ?v2 - type_4)
	(pred_4 ?v4 - type_3)
	(pred_6 ?v4 - type_3))                                                                                           
(:action op_1 
        :parameters (?v5 - type_4 ?v3 - type_4 ?v7 - type_1)
        :precondition (and (pred_3 ?v7 ?v5) 
                           (pred_5 ?v5 ?v3))                                                          
        :effect (and (not (pred_3 ?v7 ?v5)) (pred_3 ?v7 ?v3)))

(:action op_3 
        :parameters (?v1 - type_4 ?v6 - type_5 ?v7 - type_1)
        :precondition (and (pred_3 ?v7 ?v1) 
                           (pred_3 ?v6 ?v1))
        :effect (and (not (pred_3 ?v6 ?v1))
                     (pred_1 ?v7 ?v6)))

(:action op_2 
        :parameters (?v1 - type_4 ?v6 - type_5 ?v7 - type_1 ?v4 - type_3)
        :precondition (and (pred_3 ?v7 ?v1) 
		      	   (pred_3 ?v4 ?v1)
			   (pred_1 ?v7 ?v6)
			   (pred_2 ?v6)
			   (pred_6 ?v4))
        :effect (and (not (pred_6 ?v4))(not (pred_2 ?v6)) (pred_4 ?v4)))
)