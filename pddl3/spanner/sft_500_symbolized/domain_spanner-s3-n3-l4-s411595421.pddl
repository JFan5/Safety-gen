(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_2 type_5 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v2 - type_1 ?v4 - type_4)
	(pred_3 ?v2 - type_2 ?v5 - type_3)
	(pred_2 ?v5 - type_3)
	(pred_5 ?v3 - type_4 ?v7 - type_4)
	(pred_6 ?v6 - type_5)
	(pred_1 ?v6 - type_5))                                                                                           
(:action op_3 
        :parameters (?v8 - type_4 ?v1 - type_4 ?v2 - type_2)
        :precondition (and (pred_4 ?v2 ?v8) 
                           (pred_5 ?v8 ?v1))                                                          
        :effect (and (not (pred_4 ?v2 ?v8)) (pred_4 ?v2 ?v1)))

(:action op_2 
        :parameters (?v4 - type_4 ?v5 - type_3 ?v2 - type_2)
        :precondition (and (pred_4 ?v2 ?v4) 
                           (pred_4 ?v5 ?v4))
        :effect (and (not (pred_4 ?v5 ?v4))
                     (pred_3 ?v2 ?v5)))

(:action op_1 
        :parameters (?v4 - type_4 ?v5 - type_3 ?v2 - type_2 ?v6 - type_5)
        :precondition (and (pred_4 ?v2 ?v4) 
		      	   (pred_4 ?v6 ?v4)
			   (pred_3 ?v2 ?v5)
			   (pred_2 ?v5)
			   (pred_1 ?v6))
        :effect (and (not (pred_1 ?v6))(not (pred_2 ?v5)) (pred_6 ?v6)))
)