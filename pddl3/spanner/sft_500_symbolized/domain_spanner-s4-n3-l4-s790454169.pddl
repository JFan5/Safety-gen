(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_3 type_2 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v6 - type_5 ?v1 - type_1)
	(pred_3 ?v6 - type_3 ?v3 - type_4)
	(pred_1 ?v3 - type_4)
	(pred_4 ?v5 - type_1 ?v2 - type_1)
	(pred_2 ?v8 - type_2)
	(pred_5 ?v8 - type_2))                                                                                           
(:action op_3 
        :parameters (?v7 - type_1 ?v4 - type_1 ?v6 - type_3)
        :precondition (and (pred_6 ?v6 ?v7) 
                           (pred_4 ?v7 ?v4))                                                          
        :effect (and (not (pred_6 ?v6 ?v7)) (pred_6 ?v6 ?v4)))

(:action op_2 
        :parameters (?v1 - type_1 ?v3 - type_4 ?v6 - type_3)
        :precondition (and (pred_6 ?v6 ?v1) 
                           (pred_6 ?v3 ?v1))
        :effect (and (not (pred_6 ?v3 ?v1))
                     (pred_3 ?v6 ?v3)))

(:action op_1 
        :parameters (?v1 - type_1 ?v3 - type_4 ?v6 - type_3 ?v8 - type_2)
        :precondition (and (pred_6 ?v6 ?v1) 
		      	   (pred_6 ?v8 ?v1)
			   (pred_3 ?v6 ?v3)
			   (pred_1 ?v3)
			   (pred_5 ?v8))
        :effect (and (not (pred_5 ?v8))(not (pred_1 ?v3)) (pred_2 ?v8)))
)