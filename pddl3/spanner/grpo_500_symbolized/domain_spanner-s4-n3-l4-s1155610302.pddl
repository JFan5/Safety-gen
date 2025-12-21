(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_5 type_1 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v6 - type_3 ?v7 - type_4)
	(pred_1 ?v6 - type_5 ?v1 - type_2)
	(pred_6 ?v1 - type_2)
	(pred_3 ?v4 - type_4 ?v2 - type_4)
	(pred_4 ?v5 - type_1)
	(pred_5 ?v5 - type_1))                                                                                           
(:action op_3 
        :parameters (?v8 - type_4 ?v3 - type_4 ?v6 - type_5)
        :precondition (and (pred_2 ?v6 ?v8) 
                           (pred_3 ?v8 ?v3))                                                          
        :effect (and (not (pred_2 ?v6 ?v8)) (pred_2 ?v6 ?v3)))

(:action op_2 
        :parameters (?v7 - type_4 ?v1 - type_2 ?v6 - type_5)
        :precondition (and (pred_2 ?v6 ?v7) 
                           (pred_2 ?v1 ?v7))
        :effect (and (not (pred_2 ?v1 ?v7))
                     (pred_1 ?v6 ?v1)))

(:action op_1 
        :parameters (?v7 - type_4 ?v1 - type_2 ?v6 - type_5 ?v5 - type_1)
        :precondition (and (pred_2 ?v6 ?v7) 
		      	   (pred_2 ?v5 ?v7)
			   (pred_1 ?v6 ?v1)
			   (pred_6 ?v1)
			   (pred_5 ?v5))
        :effect (and (not (pred_5 ?v5))(not (pred_6 ?v1)) (pred_4 ?v5)))
)