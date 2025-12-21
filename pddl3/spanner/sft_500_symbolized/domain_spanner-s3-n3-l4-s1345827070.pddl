(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_1 type_2 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v4 - type_5 ?v3 - type_4)
	(pred_3 ?v4 - type_1 ?v6 - type_3)
	(pred_4 ?v6 - type_3)
	(pred_2 ?v5 - type_4 ?v2 - type_4)
	(pred_5 ?v8 - type_2)
	(pred_1 ?v8 - type_2))                                                                                           
(:action op_3 
        :parameters (?v7 - type_4 ?v1 - type_4 ?v4 - type_1)
        :precondition (and (pred_6 ?v4 ?v7) 
                           (pred_2 ?v7 ?v1))                                                          
        :effect (and (not (pred_6 ?v4 ?v7)) (pred_6 ?v4 ?v1)))

(:action op_2 
        :parameters (?v3 - type_4 ?v6 - type_3 ?v4 - type_1)
        :precondition (and (pred_6 ?v4 ?v3) 
                           (pred_6 ?v6 ?v3))
        :effect (and (not (pred_6 ?v6 ?v3))
                     (pred_3 ?v4 ?v6)))

(:action op_1 
        :parameters (?v3 - type_4 ?v6 - type_3 ?v4 - type_1 ?v8 - type_2)
        :precondition (and (pred_6 ?v4 ?v3) 
		      	   (pred_6 ?v8 ?v3)
			   (pred_3 ?v4 ?v6)
			   (pred_4 ?v6)
			   (pred_1 ?v8))
        :effect (and (not (pred_1 ?v8))(not (pred_4 ?v6)) (pred_5 ?v8)))
)