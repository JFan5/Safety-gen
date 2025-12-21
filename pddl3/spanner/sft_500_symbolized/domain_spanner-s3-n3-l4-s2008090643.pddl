(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_4 - object
	type_3 type_1 type_5 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v1 - type_4 ?v4 - type_2)
	(pred_1 ?v1 - type_3 ?v6 - type_5)
	(pred_5 ?v6 - type_5)
	(pred_3 ?v7 - type_2 ?v3 - type_2)
	(pred_4 ?v8 - type_1)
	(pred_2 ?v8 - type_1))                                                                                           
(:action op_3 
        :parameters (?v5 - type_2 ?v2 - type_2 ?v1 - type_3)
        :precondition (and (pred_6 ?v1 ?v5) 
                           (pred_3 ?v5 ?v2))                                                          
        :effect (and (not (pred_6 ?v1 ?v5)) (pred_6 ?v1 ?v2)))

(:action op_1 
        :parameters (?v4 - type_2 ?v6 - type_5 ?v1 - type_3)
        :precondition (and (pred_6 ?v1 ?v4) 
                           (pred_6 ?v6 ?v4))
        :effect (and (not (pred_6 ?v6 ?v4))
                     (pred_1 ?v1 ?v6)))

(:action op_2 
        :parameters (?v4 - type_2 ?v6 - type_5 ?v1 - type_3 ?v8 - type_1)
        :precondition (and (pred_6 ?v1 ?v4) 
		      	   (pred_6 ?v8 ?v4)
			   (pred_1 ?v1 ?v6)
			   (pred_5 ?v6)
			   (pred_2 ?v8))
        :effect (and (not (pred_2 ?v8))(not (pred_5 ?v6)) (pred_4 ?v8)))
)