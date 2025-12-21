(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_4 - object
	type_3 type_1 type_2 - type_4	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v6 - type_4 ?v7 - type_5)
	(pred_4 ?v6 - type_3 ?v8 - type_2)
	(pred_5 ?v8 - type_2)
	(pred_2 ?v2 - type_5 ?v4 - type_5)
	(pred_1 ?v5 - type_1)
	(pred_3 ?v5 - type_1))                                                                                           
(:action op_3 
        :parameters (?v3 - type_5 ?v1 - type_5 ?v6 - type_3)
        :precondition (and (pred_6 ?v6 ?v3) 
                           (pred_2 ?v3 ?v1))                                                          
        :effect (and (not (pred_6 ?v6 ?v3)) (pred_6 ?v6 ?v1)))

(:action op_1 
        :parameters (?v7 - type_5 ?v8 - type_2 ?v6 - type_3)
        :precondition (and (pred_6 ?v6 ?v7) 
                           (pred_6 ?v8 ?v7))
        :effect (and (not (pred_6 ?v8 ?v7))
                     (pred_4 ?v6 ?v8)))

(:action op_2 
        :parameters (?v7 - type_5 ?v8 - type_2 ?v6 - type_3 ?v5 - type_1)
        :precondition (and (pred_6 ?v6 ?v7) 
		      	   (pred_6 ?v5 ?v7)
			   (pred_4 ?v6 ?v8)
			   (pred_5 ?v8)
			   (pred_3 ?v5))
        :effect (and (not (pred_3 ?v5))(not (pred_5 ?v8)) (pred_1 ?v5)))
)