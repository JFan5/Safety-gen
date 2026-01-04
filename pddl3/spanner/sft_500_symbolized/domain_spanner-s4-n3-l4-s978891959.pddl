(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_3 type_2 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v6 - type_1 ?v4 - type_4)
	(pred_2 ?v6 - type_3 ?v1 - type_5)
	(pred_1 ?v1 - type_5)
	(pred_3 ?v7 - type_4 ?v2 - type_4)
	(pred_5 ?v5 - type_2)
	(pred_4 ?v5 - type_2))                                                                                           
(:action op_3 
        :parameters (?v8 - type_4 ?v3 - type_4 ?v6 - type_3)
        :precondition (and (pred_6 ?v6 ?v8) 
                           (pred_3 ?v8 ?v3))                                                          
        :effect (and (not (pred_6 ?v6 ?v8)) (pred_6 ?v6 ?v3)))

(:action op_1 
        :parameters (?v4 - type_4 ?v1 - type_5 ?v6 - type_3)
        :precondition (and (pred_6 ?v6 ?v4) 
                           (pred_6 ?v1 ?v4))
        :effect (and (not (pred_6 ?v1 ?v4))
                     (pred_2 ?v6 ?v1)))

(:action op_2 
        :parameters (?v4 - type_4 ?v1 - type_5 ?v6 - type_3 ?v5 - type_2)
        :precondition (and (pred_6 ?v6 ?v4) 
		      	   (pred_6 ?v5 ?v4)
			   (pred_2 ?v6 ?v1)
			   (pred_1 ?v1)
			   (pred_4 ?v5))
        :effect (and (not (pred_4 ?v5))(not (pred_1 ?v1)) (pred_5 ?v5)))
)