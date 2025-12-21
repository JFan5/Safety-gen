(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_5 - object
	type_4 type_3 type_2 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_4 ?v6 - type_5 ?v5 - type_1)
	(pred_3 ?v6 - type_4 ?v8 - type_2)
	(pred_1 ?v8 - type_2)
	(pred_2 ?v2 - type_1 ?v4 - type_1)
	(pred_5 ?v3 - type_3)
	(pred_6 ?v3 - type_3))                                                                                           
(:action op_1 
        :parameters (?v7 - type_1 ?v1 - type_1 ?v6 - type_4)
        :precondition (and (pred_4 ?v6 ?v7) 
                           (pred_2 ?v7 ?v1))                                                          
        :effect (and (not (pred_4 ?v6 ?v7)) (pred_4 ?v6 ?v1)))

(:action op_3 
        :parameters (?v5 - type_1 ?v8 - type_2 ?v6 - type_4)
        :precondition (and (pred_4 ?v6 ?v5) 
                           (pred_4 ?v8 ?v5))
        :effect (and (not (pred_4 ?v8 ?v5))
                     (pred_3 ?v6 ?v8)))

(:action op_2 
        :parameters (?v5 - type_1 ?v8 - type_2 ?v6 - type_4 ?v3 - type_3)
        :precondition (and (pred_4 ?v6 ?v5) 
		      	   (pred_4 ?v3 ?v5)
			   (pred_3 ?v6 ?v8)
			   (pred_1 ?v8)
			   (pred_6 ?v3))
        :effect (and (not (pred_6 ?v3))(not (pred_1 ?v8)) (pred_5 ?v3)))
)