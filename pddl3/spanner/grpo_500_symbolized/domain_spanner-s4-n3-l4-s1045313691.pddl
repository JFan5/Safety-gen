(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_5 type_3 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_2 ?v7 - type_1)
	(pred_1 ?v8 - type_5 ?v6 - type_4)
	(pred_4 ?v6 - type_4)
	(pred_2 ?v5 - type_1 ?v1 - type_1)
	(pred_3 ?v2 - type_3)
	(pred_6 ?v2 - type_3))                                                                                           
(:action op_2 
        :parameters (?v4 - type_1 ?v3 - type_1 ?v8 - type_5)
        :precondition (and (pred_5 ?v8 ?v4) 
                           (pred_2 ?v4 ?v3))                                                          
        :effect (and (not (pred_5 ?v8 ?v4)) (pred_5 ?v8 ?v3)))

(:action op_1 
        :parameters (?v7 - type_1 ?v6 - type_4 ?v8 - type_5)
        :precondition (and (pred_5 ?v8 ?v7) 
                           (pred_5 ?v6 ?v7))
        :effect (and (not (pred_5 ?v6 ?v7))
                     (pred_1 ?v8 ?v6)))

(:action op_3 
        :parameters (?v7 - type_1 ?v6 - type_4 ?v8 - type_5 ?v2 - type_3)
        :precondition (and (pred_5 ?v8 ?v7) 
		      	   (pred_5 ?v2 ?v7)
			   (pred_1 ?v8 ?v6)
			   (pred_4 ?v6)
			   (pred_6 ?v2))
        :effect (and (not (pred_6 ?v2))(not (pred_4 ?v6)) (pred_3 ?v2)))
)