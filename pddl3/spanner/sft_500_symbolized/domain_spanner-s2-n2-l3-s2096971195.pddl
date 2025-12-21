(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_2 type_4 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v8 - type_1 ?v4 - type_3)
	(pred_5 ?v8 - type_2 ?v6 - type_5)
	(pred_1 ?v6 - type_5)
	(pred_2 ?v2 - type_3 ?v3 - type_3)
	(pred_4 ?v5 - type_4)
	(pred_3 ?v5 - type_4))                                                                                           
(:action op_3 
        :parameters (?v1 - type_3 ?v7 - type_3 ?v8 - type_2)
        :precondition (and (pred_6 ?v8 ?v1) 
                           (pred_2 ?v1 ?v7))                                                          
        :effect (and (not (pred_6 ?v8 ?v1)) (pred_6 ?v8 ?v7)))

(:action op_1 
        :parameters (?v4 - type_3 ?v6 - type_5 ?v8 - type_2)
        :precondition (and (pred_6 ?v8 ?v4) 
                           (pred_6 ?v6 ?v4))
        :effect (and (not (pred_6 ?v6 ?v4))
                     (pred_5 ?v8 ?v6)))

(:action op_2 
        :parameters (?v4 - type_3 ?v6 - type_5 ?v8 - type_2 ?v5 - type_4)
        :precondition (and (pred_6 ?v8 ?v4) 
		      	   (pred_6 ?v5 ?v4)
			   (pred_5 ?v8 ?v6)
			   (pred_1 ?v6)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_1 ?v6)) (pred_4 ?v5)))
)