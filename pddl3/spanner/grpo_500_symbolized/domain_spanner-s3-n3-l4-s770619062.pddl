(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_4 type_5 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v6 - type_2 ?v5 - type_1)
	(pred_6 ?v6 - type_4 ?v3 - type_3)
	(pred_1 ?v3 - type_3)
	(pred_5 ?v4 - type_1 ?v7 - type_1)
	(pred_3 ?v2 - type_5)
	(pred_2 ?v2 - type_5))                                                                                           
(:action op_2 
        :parameters (?v8 - type_1 ?v1 - type_1 ?v6 - type_4)
        :precondition (and (pred_4 ?v6 ?v8) 
                           (pred_5 ?v8 ?v1))                                                          
        :effect (and (not (pred_4 ?v6 ?v8)) (pred_4 ?v6 ?v1)))

(:action op_1 
        :parameters (?v5 - type_1 ?v3 - type_3 ?v6 - type_4)
        :precondition (and (pred_4 ?v6 ?v5) 
                           (pred_4 ?v3 ?v5))
        :effect (and (not (pred_4 ?v3 ?v5))
                     (pred_6 ?v6 ?v3)))

(:action op_3 
        :parameters (?v5 - type_1 ?v3 - type_3 ?v6 - type_4 ?v2 - type_5)
        :precondition (and (pred_4 ?v6 ?v5) 
		      	   (pred_4 ?v2 ?v5)
			   (pred_6 ?v6 ?v3)
			   (pred_1 ?v3)
			   (pred_2 ?v2))
        :effect (and (not (pred_2 ?v2))(not (pred_1 ?v3)) (pred_3 ?v2)))
)