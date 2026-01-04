(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_1 type_2 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v6 - type_5 ?v1 - type_4)
	(pred_5 ?v6 - type_1 ?v5 - type_3)
	(pred_4 ?v5 - type_3)
	(pred_2 ?v2 - type_4 ?v7 - type_4)
	(pred_6 ?v3 - type_2)
	(pred_1 ?v3 - type_2))                                                                                           
(:action op_3 
        :parameters (?v8 - type_4 ?v4 - type_4 ?v6 - type_1)
        :precondition (and (pred_3 ?v6 ?v8) 
                           (pred_2 ?v8 ?v4))                                                          
        :effect (and (not (pred_3 ?v6 ?v8)) (pred_3 ?v6 ?v4)))

(:action op_1 
        :parameters (?v1 - type_4 ?v5 - type_3 ?v6 - type_1)
        :precondition (and (pred_3 ?v6 ?v1) 
                           (pred_3 ?v5 ?v1))
        :effect (and (not (pred_3 ?v5 ?v1))
                     (pred_5 ?v6 ?v5)))

(:action op_2 
        :parameters (?v1 - type_4 ?v5 - type_3 ?v6 - type_1 ?v3 - type_2)
        :precondition (and (pred_3 ?v6 ?v1) 
		      	   (pred_3 ?v3 ?v1)
			   (pred_5 ?v6 ?v5)
			   (pred_4 ?v5)
			   (pred_1 ?v3))
        :effect (and (not (pred_1 ?v3))(not (pred_4 ?v5)) (pred_6 ?v3)))
)