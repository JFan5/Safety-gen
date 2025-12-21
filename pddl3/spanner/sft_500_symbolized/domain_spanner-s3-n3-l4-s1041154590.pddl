(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_4 type_1 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v8 - type_2 ?v1 - type_3)
	(pred_2 ?v8 - type_4 ?v6 - type_5)
	(pred_3 ?v6 - type_5)
	(pred_5 ?v2 - type_3 ?v4 - type_3)
	(pred_1 ?v5 - type_1)
	(pred_6 ?v5 - type_1))                                                                                           
(:action op_1 
        :parameters (?v7 - type_3 ?v3 - type_3 ?v8 - type_4)
        :precondition (and (pred_4 ?v8 ?v7) 
                           (pred_5 ?v7 ?v3))                                                          
        :effect (and (not (pred_4 ?v8 ?v7)) (pred_4 ?v8 ?v3)))

(:action op_3 
        :parameters (?v1 - type_3 ?v6 - type_5 ?v8 - type_4)
        :precondition (and (pred_4 ?v8 ?v1) 
                           (pred_4 ?v6 ?v1))
        :effect (and (not (pred_4 ?v6 ?v1))
                     (pred_2 ?v8 ?v6)))

(:action op_2 
        :parameters (?v1 - type_3 ?v6 - type_5 ?v8 - type_4 ?v5 - type_1)
        :precondition (and (pred_4 ?v8 ?v1) 
		      	   (pred_4 ?v5 ?v1)
			   (pred_2 ?v8 ?v6)
			   (pred_3 ?v6)
			   (pred_6 ?v5))
        :effect (and (not (pred_6 ?v5))(not (pred_3 ?v6)) (pred_1 ?v5)))
)