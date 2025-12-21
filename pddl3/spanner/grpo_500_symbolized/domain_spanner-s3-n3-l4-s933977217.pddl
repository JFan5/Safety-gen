(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_3 type_4 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v7 - type_5 ?v8 - type_1)
	(pred_3 ?v7 - type_3 ?v6 - type_2)
	(pred_2 ?v6 - type_2)
	(pred_4 ?v5 - type_1 ?v4 - type_1)
	(pred_5 ?v1 - type_4)
	(pred_1 ?v1 - type_4))                                                                                           
(:action op_3 
        :parameters (?v2 - type_1 ?v3 - type_1 ?v7 - type_3)
        :precondition (and (pred_6 ?v7 ?v2) 
                           (pred_4 ?v2 ?v3))                                                          
        :effect (and (not (pred_6 ?v7 ?v2)) (pred_6 ?v7 ?v3)))

(:action op_1 
        :parameters (?v8 - type_1 ?v6 - type_2 ?v7 - type_3)
        :precondition (and (pred_6 ?v7 ?v8) 
                           (pred_6 ?v6 ?v8))
        :effect (and (not (pred_6 ?v6 ?v8))
                     (pred_3 ?v7 ?v6)))

(:action op_2 
        :parameters (?v8 - type_1 ?v6 - type_2 ?v7 - type_3 ?v1 - type_4)
        :precondition (and (pred_6 ?v7 ?v8) 
		      	   (pred_6 ?v1 ?v8)
			   (pred_3 ?v7 ?v6)
			   (pred_2 ?v6)
			   (pred_1 ?v1))
        :effect (and (not (pred_1 ?v1))(not (pred_2 ?v6)) (pred_5 ?v1)))
)