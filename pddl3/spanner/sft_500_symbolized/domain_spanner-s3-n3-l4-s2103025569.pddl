(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_3 type_2 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v6 - type_4 ?v4 - type_5)
	(pred_1 ?v6 - type_3 ?v3 - type_1)
	(pred_2 ?v3 - type_1)
	(pred_3 ?v7 - type_5 ?v8 - type_5)
	(pred_6 ?v1 - type_2)
	(pred_5 ?v1 - type_2))                                                                                           
(:action op_2 
        :parameters (?v5 - type_5 ?v2 - type_5 ?v6 - type_3)
        :precondition (and (pred_4 ?v6 ?v5) 
                           (pred_3 ?v5 ?v2))                                                          
        :effect (and (not (pred_4 ?v6 ?v5)) (pred_4 ?v6 ?v2)))

(:action op_1 
        :parameters (?v4 - type_5 ?v3 - type_1 ?v6 - type_3)
        :precondition (and (pred_4 ?v6 ?v4) 
                           (pred_4 ?v3 ?v4))
        :effect (and (not (pred_4 ?v3 ?v4))
                     (pred_1 ?v6 ?v3)))

(:action op_3 
        :parameters (?v4 - type_5 ?v3 - type_1 ?v6 - type_3 ?v1 - type_2)
        :precondition (and (pred_4 ?v6 ?v4) 
		      	   (pred_4 ?v1 ?v4)
			   (pred_1 ?v6 ?v3)
			   (pred_2 ?v3)
			   (pred_5 ?v1))
        :effect (and (not (pred_5 ?v1))(not (pred_2 ?v3)) (pred_6 ?v1)))
)