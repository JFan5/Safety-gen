(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_2 type_4 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v6 - type_1 ?v7 - type_3)
	(pred_1 ?v6 - type_2 ?v1 - type_5)
	(pred_3 ?v1 - type_5)
	(pred_2 ?v8 - type_3 ?v2 - type_3)
	(pred_6 ?v3 - type_4)
	(pred_5 ?v3 - type_4))                                                                                           
(:action op_3 
        :parameters (?v4 - type_3 ?v5 - type_3 ?v6 - type_2)
        :precondition (and (pred_4 ?v6 ?v4) 
                           (pred_2 ?v4 ?v5))                                                          
        :effect (and (not (pred_4 ?v6 ?v4)) (pred_4 ?v6 ?v5)))

(:action op_1 
        :parameters (?v7 - type_3 ?v1 - type_5 ?v6 - type_2)
        :precondition (and (pred_4 ?v6 ?v7) 
                           (pred_4 ?v1 ?v7))
        :effect (and (not (pred_4 ?v1 ?v7))
                     (pred_1 ?v6 ?v1)))

(:action op_2 
        :parameters (?v7 - type_3 ?v1 - type_5 ?v6 - type_2 ?v3 - type_4)
        :precondition (and (pred_4 ?v6 ?v7) 
		      	   (pred_4 ?v3 ?v7)
			   (pred_1 ?v6 ?v1)
			   (pred_3 ?v1)
			   (pred_5 ?v3))
        :effect (and (not (pred_5 ?v3))(not (pred_3 ?v1)) (pred_6 ?v3)))
)