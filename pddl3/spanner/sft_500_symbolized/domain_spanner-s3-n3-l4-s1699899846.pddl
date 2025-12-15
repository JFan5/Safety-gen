(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_1 type_4 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v5 - type_2 ?v4 - type_3)
	(pred_6 ?v5 - type_1 ?v3 - type_5)
	(pred_4 ?v3 - type_5)
	(pred_1 ?v7 - type_3 ?v8 - type_3)
	(pred_5 ?v6 - type_4)
	(pred_2 ?v6 - type_4))                                                                                           
(:action op_3 
        :parameters (?v1 - type_3 ?v2 - type_3 ?v5 - type_1)
        :precondition (and (pred_3 ?v5 ?v1) 
                           (pred_1 ?v1 ?v2))                                                          
        :effect (and (not (pred_3 ?v5 ?v1)) (pred_3 ?v5 ?v2)))

(:action op_2 
        :parameters (?v4 - type_3 ?v3 - type_5 ?v5 - type_1)
        :precondition (and (pred_3 ?v5 ?v4) 
                           (pred_3 ?v3 ?v4))
        :effect (and (not (pred_3 ?v3 ?v4))
                     (pred_6 ?v5 ?v3)))

(:action op_1 
        :parameters (?v4 - type_3 ?v3 - type_5 ?v5 - type_1 ?v6 - type_4)
        :precondition (and (pred_3 ?v5 ?v4) 
		      	   (pred_3 ?v6 ?v4)
			   (pred_6 ?v5 ?v3)
			   (pred_4 ?v3)
			   (pred_2 ?v6))
        :effect (and (not (pred_2 ?v6))(not (pred_4 ?v3)) (pred_5 ?v6)))
)