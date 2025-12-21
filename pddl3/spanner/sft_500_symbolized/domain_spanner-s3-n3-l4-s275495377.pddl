(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_5 - object
	type_2 type_1 type_4 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v8 - type_5 ?v4 - type_3)
	(pred_6 ?v8 - type_2 ?v5 - type_4)
	(pred_1 ?v5 - type_4)
	(pred_5 ?v3 - type_3 ?v2 - type_3)
	(pred_2 ?v1 - type_1)
	(pred_4 ?v1 - type_1))                                                                                           
(:action op_1 
        :parameters (?v7 - type_3 ?v6 - type_3 ?v8 - type_2)
        :precondition (and (pred_3 ?v8 ?v7) 
                           (pred_5 ?v7 ?v6))                                                          
        :effect (and (not (pred_3 ?v8 ?v7)) (pred_3 ?v8 ?v6)))

(:action op_3 
        :parameters (?v4 - type_3 ?v5 - type_4 ?v8 - type_2)
        :precondition (and (pred_3 ?v8 ?v4) 
                           (pred_3 ?v5 ?v4))
        :effect (and (not (pred_3 ?v5 ?v4))
                     (pred_6 ?v8 ?v5)))

(:action op_2 
        :parameters (?v4 - type_3 ?v5 - type_4 ?v8 - type_2 ?v1 - type_1)
        :precondition (and (pred_3 ?v8 ?v4) 
		      	   (pred_3 ?v1 ?v4)
			   (pred_6 ?v8 ?v5)
			   (pred_1 ?v5)
			   (pred_4 ?v1))
        :effect (and (not (pred_4 ?v1))(not (pred_1 ?v5)) (pred_2 ?v1)))
)