(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_2 type_3 type_1 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_2 ?v2 - type_4 ?v4 - type_5)
	(pred_1 ?v2 - type_2 ?v6 - type_1)
	(pred_6 ?v6 - type_1)
	(pred_5 ?v7 - type_5 ?v5 - type_5)
	(pred_3 ?v8 - type_3)
	(pred_4 ?v8 - type_3))                                                                                           
(:action op_1 
        :parameters (?v3 - type_5 ?v1 - type_5 ?v2 - type_2)
        :precondition (and (pred_2 ?v2 ?v3) 
                           (pred_5 ?v3 ?v1))                                                          
        :effect (and (not (pred_2 ?v2 ?v3)) (pred_2 ?v2 ?v1)))

(:action op_3 
        :parameters (?v4 - type_5 ?v6 - type_1 ?v2 - type_2)
        :precondition (and (pred_2 ?v2 ?v4) 
                           (pred_2 ?v6 ?v4))
        :effect (and (not (pred_2 ?v6 ?v4))
                     (pred_1 ?v2 ?v6)))

(:action op_2 
        :parameters (?v4 - type_5 ?v6 - type_1 ?v2 - type_2 ?v8 - type_3)
        :precondition (and (pred_2 ?v2 ?v4) 
		      	   (pred_2 ?v8 ?v4)
			   (pred_1 ?v2 ?v6)
			   (pred_6 ?v6)
			   (pred_4 ?v8))
        :effect (and (not (pred_4 ?v8))(not (pred_6 ?v6)) (pred_3 ?v8)))
)