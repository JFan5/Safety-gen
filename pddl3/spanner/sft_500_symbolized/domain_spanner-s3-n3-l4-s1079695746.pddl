(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_2 type_1 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v7 - type_5 ?v8 - type_3)
	(pred_5 ?v7 - type_2 ?v6 - type_4)
	(pred_2 ?v6 - type_4)
	(pred_6 ?v2 - type_3 ?v5 - type_3)
	(pred_1 ?v3 - type_1)
	(pred_4 ?v3 - type_1))                                                                                           
(:action op_1 
        :parameters (?v1 - type_3 ?v4 - type_3 ?v7 - type_2)
        :precondition (and (pred_3 ?v7 ?v1) 
                           (pred_6 ?v1 ?v4))                                                          
        :effect (and (not (pred_3 ?v7 ?v1)) (pred_3 ?v7 ?v4)))

(:action op_2 
        :parameters (?v8 - type_3 ?v6 - type_4 ?v7 - type_2)
        :precondition (and (pred_3 ?v7 ?v8) 
                           (pred_3 ?v6 ?v8))
        :effect (and (not (pred_3 ?v6 ?v8))
                     (pred_5 ?v7 ?v6)))

(:action op_3 
        :parameters (?v8 - type_3 ?v6 - type_4 ?v7 - type_2 ?v3 - type_1)
        :precondition (and (pred_3 ?v7 ?v8) 
		      	   (pred_3 ?v3 ?v8)
			   (pred_5 ?v7 ?v6)
			   (pred_2 ?v6)
			   (pred_4 ?v3))
        :effect (and (not (pred_4 ?v3))(not (pred_2 ?v6)) (pred_1 ?v3)))
)