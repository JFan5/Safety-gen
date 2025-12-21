(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_5 type_4 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v3 - type_1 ?v8 - type_3)
	(pred_5 ?v3 - type_5 ?v6 - type_2)
	(pred_2 ?v6 - type_2)
	(pred_1 ?v5 - type_3 ?v7 - type_3)
	(pred_6 ?v4 - type_4)
	(pred_4 ?v4 - type_4))                                                                                           
(:action op_3 
        :parameters (?v2 - type_3 ?v1 - type_3 ?v3 - type_5)
        :precondition (and (pred_3 ?v3 ?v2) 
                           (pred_1 ?v2 ?v1))                                                          
        :effect (and (not (pred_3 ?v3 ?v2)) (pred_3 ?v3 ?v1)))

(:action op_1 
        :parameters (?v8 - type_3 ?v6 - type_2 ?v3 - type_5)
        :precondition (and (pred_3 ?v3 ?v8) 
                           (pred_3 ?v6 ?v8))
        :effect (and (not (pred_3 ?v6 ?v8))
                     (pred_5 ?v3 ?v6)))

(:action op_2 
        :parameters (?v8 - type_3 ?v6 - type_2 ?v3 - type_5 ?v4 - type_4)
        :precondition (and (pred_3 ?v3 ?v8) 
		      	   (pred_3 ?v4 ?v8)
			   (pred_5 ?v3 ?v6)
			   (pred_2 ?v6)
			   (pred_4 ?v4))
        :effect (and (not (pred_4 ?v4))(not (pred_2 ?v6)) (pred_6 ?v4)))
)