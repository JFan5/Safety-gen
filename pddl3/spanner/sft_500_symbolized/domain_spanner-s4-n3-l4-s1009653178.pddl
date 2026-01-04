(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_5 - object
	type_3 type_4 type_1 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v8 - type_5 ?v2 - type_2)
	(pred_6 ?v8 - type_3 ?v6 - type_1)
	(pred_5 ?v6 - type_1)
	(pred_3 ?v4 - type_2 ?v7 - type_2)
	(pred_2 ?v1 - type_4)
	(pred_1 ?v1 - type_4))                                                                                           
(:action op_1 
        :parameters (?v3 - type_2 ?v5 - type_2 ?v8 - type_3)
        :precondition (and (pred_4 ?v8 ?v3) 
                           (pred_3 ?v3 ?v5))                                                          
        :effect (and (not (pred_4 ?v8 ?v3)) (pred_4 ?v8 ?v5)))

(:action op_2 
        :parameters (?v2 - type_2 ?v6 - type_1 ?v8 - type_3)
        :precondition (and (pred_4 ?v8 ?v2) 
                           (pred_4 ?v6 ?v2))
        :effect (and (not (pred_4 ?v6 ?v2))
                     (pred_6 ?v8 ?v6)))

(:action op_3 
        :parameters (?v2 - type_2 ?v6 - type_1 ?v8 - type_3 ?v1 - type_4)
        :precondition (and (pred_4 ?v8 ?v2) 
		      	   (pred_4 ?v1 ?v2)
			   (pred_6 ?v8 ?v6)
			   (pred_5 ?v6)
			   (pred_1 ?v1))
        :effect (and (not (pred_1 ?v1))(not (pred_5 ?v6)) (pred_2 ?v1)))
)