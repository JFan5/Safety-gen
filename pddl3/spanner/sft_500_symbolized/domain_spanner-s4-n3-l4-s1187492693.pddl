(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_5 type_4 type_1 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v3 - type_2 ?v7 - type_3)
	(pred_2 ?v3 - type_5 ?v8 - type_1)
	(pred_5 ?v8 - type_1)
	(pred_1 ?v6 - type_3 ?v2 - type_3)
	(pred_3 ?v1 - type_4)
	(pred_4 ?v1 - type_4))                                                                                           
(:action op_3 
        :parameters (?v5 - type_3 ?v4 - type_3 ?v3 - type_5)
        :precondition (and (pred_6 ?v3 ?v5) 
                           (pred_1 ?v5 ?v4))                                                          
        :effect (and (not (pred_6 ?v3 ?v5)) (pred_6 ?v3 ?v4)))

(:action op_1 
        :parameters (?v7 - type_3 ?v8 - type_1 ?v3 - type_5)
        :precondition (and (pred_6 ?v3 ?v7) 
                           (pred_6 ?v8 ?v7))
        :effect (and (not (pred_6 ?v8 ?v7))
                     (pred_2 ?v3 ?v8)))

(:action op_2 
        :parameters (?v7 - type_3 ?v8 - type_1 ?v3 - type_5 ?v1 - type_4)
        :precondition (and (pred_6 ?v3 ?v7) 
		      	   (pred_6 ?v1 ?v7)
			   (pred_2 ?v3 ?v8)
			   (pred_5 ?v8)
			   (pred_4 ?v1))
        :effect (and (not (pred_4 ?v1))(not (pred_5 ?v8)) (pred_3 ?v1)))
)