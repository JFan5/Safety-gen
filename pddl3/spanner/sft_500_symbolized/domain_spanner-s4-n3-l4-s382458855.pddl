(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_5 type_3 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v7 - type_1 ?v3 - type_4)
	(pred_1 ?v7 - type_5 ?v8 - type_2)
	(pred_2 ?v8 - type_2)
	(pred_3 ?v4 - type_4 ?v1 - type_4)
	(pred_4 ?v6 - type_3)
	(pred_5 ?v6 - type_3))                                                                                           
(:action op_2 
        :parameters (?v5 - type_4 ?v2 - type_4 ?v7 - type_5)
        :precondition (and (pred_6 ?v7 ?v5) 
                           (pred_3 ?v5 ?v2))                                                          
        :effect (and (not (pred_6 ?v7 ?v5)) (pred_6 ?v7 ?v2)))

(:action op_1 
        :parameters (?v3 - type_4 ?v8 - type_2 ?v7 - type_5)
        :precondition (and (pred_6 ?v7 ?v3) 
                           (pred_6 ?v8 ?v3))
        :effect (and (not (pred_6 ?v8 ?v3))
                     (pred_1 ?v7 ?v8)))

(:action op_3 
        :parameters (?v3 - type_4 ?v8 - type_2 ?v7 - type_5 ?v6 - type_3)
        :precondition (and (pred_6 ?v7 ?v3) 
		      	   (pred_6 ?v6 ?v3)
			   (pred_1 ?v7 ?v8)
			   (pred_2 ?v8)
			   (pred_5 ?v6))
        :effect (and (not (pred_5 ?v6))(not (pred_2 ?v8)) (pred_4 ?v6)))
)