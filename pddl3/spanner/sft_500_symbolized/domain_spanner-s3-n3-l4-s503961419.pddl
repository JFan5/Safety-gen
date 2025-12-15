(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_2 - object
	type_5 type_1 type_3 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_2 ?v4 - type_4)
	(pred_6 ?v8 - type_5 ?v2 - type_3)
	(pred_1 ?v2 - type_3)
	(pred_4 ?v5 - type_4 ?v1 - type_4)
	(pred_3 ?v3 - type_1)
	(pred_2 ?v3 - type_1))                                                                                           
(:action op_1 
        :parameters (?v7 - type_4 ?v6 - type_4 ?v8 - type_5)
        :precondition (and (pred_5 ?v8 ?v7) 
                           (pred_4 ?v7 ?v6))                                                          
        :effect (and (not (pred_5 ?v8 ?v7)) (pred_5 ?v8 ?v6)))

(:action op_2 
        :parameters (?v4 - type_4 ?v2 - type_3 ?v8 - type_5)
        :precondition (and (pred_5 ?v8 ?v4) 
                           (pred_5 ?v2 ?v4))
        :effect (and (not (pred_5 ?v2 ?v4))
                     (pred_6 ?v8 ?v2)))

(:action op_3 
        :parameters (?v4 - type_4 ?v2 - type_3 ?v8 - type_5 ?v3 - type_1)
        :precondition (and (pred_5 ?v8 ?v4) 
		      	   (pred_5 ?v3 ?v4)
			   (pred_6 ?v8 ?v2)
			   (pred_1 ?v2)
			   (pred_2 ?v3))
        :effect (and (not (pred_2 ?v3))(not (pred_1 ?v2)) (pred_3 ?v3)))
)