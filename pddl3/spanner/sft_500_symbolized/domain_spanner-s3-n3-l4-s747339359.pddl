(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_3 - object
	type_1 type_2 type_5 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v8 - type_3 ?v7 - type_4)
	(pred_3 ?v8 - type_1 ?v5 - type_5)
	(pred_4 ?v5 - type_5)
	(pred_2 ?v4 - type_4 ?v2 - type_4)
	(pred_1 ?v6 - type_2)
	(pred_6 ?v6 - type_2))                                                                                           
(:action op_3 
        :parameters (?v3 - type_4 ?v1 - type_4 ?v8 - type_1)
        :precondition (and (pred_5 ?v8 ?v3) 
                           (pred_2 ?v3 ?v1))                                                          
        :effect (and (not (pred_5 ?v8 ?v3)) (pred_5 ?v8 ?v1)))

(:action op_2 
        :parameters (?v7 - type_4 ?v5 - type_5 ?v8 - type_1)
        :precondition (and (pred_5 ?v8 ?v7) 
                           (pred_5 ?v5 ?v7))
        :effect (and (not (pred_5 ?v5 ?v7))
                     (pred_3 ?v8 ?v5)))

(:action op_1 
        :parameters (?v7 - type_4 ?v5 - type_5 ?v8 - type_1 ?v6 - type_2)
        :precondition (and (pred_5 ?v8 ?v7) 
		      	   (pred_5 ?v6 ?v7)
			   (pred_3 ?v8 ?v5)
			   (pred_4 ?v5)
			   (pred_6 ?v6))
        :effect (and (not (pred_6 ?v6))(not (pred_4 ?v5)) (pred_1 ?v6)))
)