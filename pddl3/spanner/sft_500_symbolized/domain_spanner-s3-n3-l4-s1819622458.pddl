(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_2 type_1 - object
	type_3 type_5 type_4 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v1 - type_1 ?v4 - type_2)
	(pred_5 ?v1 - type_3 ?v6 - type_4)
	(pred_2 ?v6 - type_4)
	(pred_6 ?v5 - type_2 ?v2 - type_2)
	(pred_4 ?v8 - type_5)
	(pred_3 ?v8 - type_5))                                                                                           
(:action op_3 
        :parameters (?v3 - type_2 ?v7 - type_2 ?v1 - type_3)
        :precondition (and (pred_1 ?v1 ?v3) 
                           (pred_6 ?v3 ?v7))                                                          
        :effect (and (not (pred_1 ?v1 ?v3)) (pred_1 ?v1 ?v7)))

(:action op_1 
        :parameters (?v4 - type_2 ?v6 - type_4 ?v1 - type_3)
        :precondition (and (pred_1 ?v1 ?v4) 
                           (pred_1 ?v6 ?v4))
        :effect (and (not (pred_1 ?v6 ?v4))
                     (pred_5 ?v1 ?v6)))

(:action op_2 
        :parameters (?v4 - type_2 ?v6 - type_4 ?v1 - type_3 ?v8 - type_5)
        :precondition (and (pred_1 ?v1 ?v4) 
		      	   (pred_1 ?v8 ?v4)
			   (pred_5 ?v1 ?v6)
			   (pred_2 ?v6)
			   (pred_3 ?v8))
        :effect (and (not (pred_3 ?v8))(not (pred_2 ?v6)) (pred_4 ?v8)))
)