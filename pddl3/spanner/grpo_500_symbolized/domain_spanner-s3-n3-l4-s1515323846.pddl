(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_4 type_5 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v6 - type_2 ?v1 - type_1)
	(pred_6 ?v6 - type_4 ?v5 - type_3)
	(pred_3 ?v5 - type_3)
	(pred_2 ?v7 - type_1 ?v3 - type_1)
	(pred_1 ?v8 - type_5)
	(pred_5 ?v8 - type_5))                                                                                           
(:action op_1 
        :parameters (?v4 - type_1 ?v2 - type_1 ?v6 - type_4)
        :precondition (and (pred_4 ?v6 ?v4) 
                           (pred_2 ?v4 ?v2))                                                          
        :effect (and (not (pred_4 ?v6 ?v4)) (pred_4 ?v6 ?v2)))

(:action op_2 
        :parameters (?v1 - type_1 ?v5 - type_3 ?v6 - type_4)
        :precondition (and (pred_4 ?v6 ?v1) 
                           (pred_4 ?v5 ?v1))
        :effect (and (not (pred_4 ?v5 ?v1))
                     (pred_6 ?v6 ?v5)))

(:action op_3 
        :parameters (?v1 - type_1 ?v5 - type_3 ?v6 - type_4 ?v8 - type_5)
        :precondition (and (pred_4 ?v6 ?v1) 
		      	   (pred_4 ?v8 ?v1)
			   (pred_6 ?v6 ?v5)
			   (pred_3 ?v5)
			   (pred_5 ?v8))
        :effect (and (not (pred_5 ?v8))(not (pred_3 ?v5)) (pred_1 ?v8)))
)