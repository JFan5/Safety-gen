(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_3 - object
	type_2 type_4 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v8 - type_3 ?v1 - type_1)
	(pred_2 ?v8 - type_2 ?v6 - type_5)
	(pred_3 ?v6 - type_5)
	(pred_5 ?v4 - type_1 ?v5 - type_1)
	(pred_4 ?v3 - type_4)
	(pred_6 ?v3 - type_4))                                                                                           
(:action op_3 
        :parameters (?v2 - type_1 ?v7 - type_1 ?v8 - type_2)
        :precondition (and (pred_1 ?v8 ?v2) 
                           (pred_5 ?v2 ?v7))                                                          
        :effect (and (not (pred_1 ?v8 ?v2)) (pred_1 ?v8 ?v7)))

(:action op_1 
        :parameters (?v1 - type_1 ?v6 - type_5 ?v8 - type_2)
        :precondition (and (pred_1 ?v8 ?v1) 
                           (pred_1 ?v6 ?v1))
        :effect (and (not (pred_1 ?v6 ?v1))
                     (pred_2 ?v8 ?v6)))

(:action op_2 
        :parameters (?v1 - type_1 ?v6 - type_5 ?v8 - type_2 ?v3 - type_4)
        :precondition (and (pred_1 ?v8 ?v1) 
		      	   (pred_1 ?v3 ?v1)
			   (pred_2 ?v8 ?v6)
			   (pred_3 ?v6)
			   (pred_6 ?v3))
        :effect (and (not (pred_6 ?v3))(not (pred_3 ?v6)) (pred_4 ?v3)))
)