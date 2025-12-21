(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_5 type_2 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v6 - type_3 ?v4 - type_4)
	(pred_6 ?v6 - type_5 ?v2 - type_1)
	(pred_2 ?v2 - type_1)
	(pred_1 ?v7 - type_4 ?v3 - type_4)
	(pred_4 ?v1 - type_2)
	(pred_3 ?v1 - type_2))                                                                                           
(:action op_3 
        :parameters (?v5 - type_4 ?v8 - type_4 ?v6 - type_5)
        :precondition (and (pred_5 ?v6 ?v5) 
                           (pred_1 ?v5 ?v8))                                                          
        :effect (and (not (pred_5 ?v6 ?v5)) (pred_5 ?v6 ?v8)))

(:action op_1 
        :parameters (?v4 - type_4 ?v2 - type_1 ?v6 - type_5)
        :precondition (and (pred_5 ?v6 ?v4) 
                           (pred_5 ?v2 ?v4))
        :effect (and (not (pred_5 ?v2 ?v4))
                     (pred_6 ?v6 ?v2)))

(:action op_2 
        :parameters (?v4 - type_4 ?v2 - type_1 ?v6 - type_5 ?v1 - type_2)
        :precondition (and (pred_5 ?v6 ?v4) 
		      	   (pred_5 ?v1 ?v4)
			   (pred_6 ?v6 ?v2)
			   (pred_2 ?v2)
			   (pred_3 ?v1))
        :effect (and (not (pred_3 ?v1))(not (pred_2 ?v2)) (pred_4 ?v1)))
)