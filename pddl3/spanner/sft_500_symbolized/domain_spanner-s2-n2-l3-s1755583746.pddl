(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_1 type_2 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v4 - type_5 ?v3 - type_3)
	(pred_3 ?v4 - type_1 ?v5 - type_4)
	(pred_4 ?v5 - type_4)
	(pred_6 ?v7 - type_3 ?v2 - type_3)
	(pred_2 ?v6 - type_2)
	(pred_5 ?v6 - type_2))                                                                                           
(:action op_1 
        :parameters (?v1 - type_3 ?v8 - type_3 ?v4 - type_1)
        :precondition (and (pred_1 ?v4 ?v1) 
                           (pred_6 ?v1 ?v8))                                                          
        :effect (and (not (pred_1 ?v4 ?v1)) (pred_1 ?v4 ?v8)))

(:action op_2 
        :parameters (?v3 - type_3 ?v5 - type_4 ?v4 - type_1)
        :precondition (and (pred_1 ?v4 ?v3) 
                           (pred_1 ?v5 ?v3))
        :effect (and (not (pred_1 ?v5 ?v3))
                     (pred_3 ?v4 ?v5)))

(:action op_3 
        :parameters (?v3 - type_3 ?v5 - type_4 ?v4 - type_1 ?v6 - type_2)
        :precondition (and (pred_1 ?v4 ?v3) 
		      	   (pred_1 ?v6 ?v3)
			   (pred_3 ?v4 ?v5)
			   (pred_4 ?v5)
			   (pred_5 ?v6))
        :effect (and (not (pred_5 ?v6))(not (pred_4 ?v5)) (pred_2 ?v6)))
)