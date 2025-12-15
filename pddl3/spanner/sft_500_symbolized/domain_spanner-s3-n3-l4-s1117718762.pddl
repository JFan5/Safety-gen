(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_2 type_1 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v6 - type_3 ?v4 - type_4)
	(pred_6 ?v6 - type_2 ?v3 - type_5)
	(pred_2 ?v3 - type_5)
	(pred_5 ?v1 - type_4 ?v2 - type_4)
	(pred_3 ?v7 - type_1)
	(pred_4 ?v7 - type_1))                                                                                           
(:action op_3 
        :parameters (?v8 - type_4 ?v5 - type_4 ?v6 - type_2)
        :precondition (and (pred_1 ?v6 ?v8) 
                           (pred_5 ?v8 ?v5))                                                          
        :effect (and (not (pred_1 ?v6 ?v8)) (pred_1 ?v6 ?v5)))

(:action op_1 
        :parameters (?v4 - type_4 ?v3 - type_5 ?v6 - type_2)
        :precondition (and (pred_1 ?v6 ?v4) 
                           (pred_1 ?v3 ?v4))
        :effect (and (not (pred_1 ?v3 ?v4))
                     (pred_6 ?v6 ?v3)))

(:action op_2 
        :parameters (?v4 - type_4 ?v3 - type_5 ?v6 - type_2 ?v7 - type_1)
        :precondition (and (pred_1 ?v6 ?v4) 
		      	   (pred_1 ?v7 ?v4)
			   (pred_6 ?v6 ?v3)
			   (pred_2 ?v3)
			   (pred_4 ?v7))
        :effect (and (not (pred_4 ?v7))(not (pred_2 ?v3)) (pred_3 ?v7)))
)