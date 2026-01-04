(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_1 type_3 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v6 - type_5 ?v4 - type_4)
	(pred_6 ?v6 - type_1 ?v5 - type_2)
	(pred_2 ?v5 - type_2)
	(pred_3 ?v7 - type_4 ?v1 - type_4)
	(pred_5 ?v2 - type_3)
	(pred_4 ?v2 - type_3))                                                                                           
(:action op_2 
        :parameters (?v8 - type_4 ?v3 - type_4 ?v6 - type_1)
        :precondition (and (pred_1 ?v6 ?v8) 
                           (pred_3 ?v8 ?v3))                                                          
        :effect (and (not (pred_1 ?v6 ?v8)) (pred_1 ?v6 ?v3)))

(:action op_1 
        :parameters (?v4 - type_4 ?v5 - type_2 ?v6 - type_1)
        :precondition (and (pred_1 ?v6 ?v4) 
                           (pred_1 ?v5 ?v4))
        :effect (and (not (pred_1 ?v5 ?v4))
                     (pred_6 ?v6 ?v5)))

(:action op_3 
        :parameters (?v4 - type_4 ?v5 - type_2 ?v6 - type_1 ?v2 - type_3)
        :precondition (and (pred_1 ?v6 ?v4) 
		      	   (pred_1 ?v2 ?v4)
			   (pred_6 ?v6 ?v5)
			   (pred_2 ?v5)
			   (pred_4 ?v2))
        :effect (and (not (pred_4 ?v2))(not (pred_2 ?v5)) (pred_5 ?v2)))
)