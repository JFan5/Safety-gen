(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_2 type_1 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v3 - type_5 ?v8 - type_3)
	(pred_3 ?v3 - type_2 ?v5 - type_4)
	(pred_2 ?v5 - type_4)
	(pred_4 ?v1 - type_3 ?v7 - type_3)
	(pred_5 ?v6 - type_1)
	(pred_1 ?v6 - type_1))                                                                                           
(:action op_3 
        :parameters (?v4 - type_3 ?v2 - type_3 ?v3 - type_2)
        :precondition (and (pred_6 ?v3 ?v4) 
                           (pred_4 ?v4 ?v2))                                                          
        :effect (and (not (pred_6 ?v3 ?v4)) (pred_6 ?v3 ?v2)))

(:action op_1 
        :parameters (?v8 - type_3 ?v5 - type_4 ?v3 - type_2)
        :precondition (and (pred_6 ?v3 ?v8) 
                           (pred_6 ?v5 ?v8))
        :effect (and (not (pred_6 ?v5 ?v8))
                     (pred_3 ?v3 ?v5)))

(:action op_2 
        :parameters (?v8 - type_3 ?v5 - type_4 ?v3 - type_2 ?v6 - type_1)
        :precondition (and (pred_6 ?v3 ?v8) 
		      	   (pred_6 ?v6 ?v8)
			   (pred_3 ?v3 ?v5)
			   (pred_2 ?v5)
			   (pred_1 ?v6))
        :effect (and (not (pred_1 ?v6))(not (pred_2 ?v5)) (pred_5 ?v6)))
)