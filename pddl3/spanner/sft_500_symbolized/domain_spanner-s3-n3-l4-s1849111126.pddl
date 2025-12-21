(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_1 - object
	type_2 type_4 type_3 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_5 ?v2 - type_1 ?v5 - type_5)
	(pred_6 ?v2 - type_2 ?v6 - type_3)
	(pred_3 ?v6 - type_3)
	(pred_4 ?v4 - type_5 ?v7 - type_5)
	(pred_2 ?v1 - type_4)
	(pred_1 ?v1 - type_4))                                                                                           
(:action op_3 
        :parameters (?v3 - type_5 ?v8 - type_5 ?v2 - type_2)
        :precondition (and (pred_5 ?v2 ?v3) 
                           (pred_4 ?v3 ?v8))                                                          
        :effect (and (not (pred_5 ?v2 ?v3)) (pred_5 ?v2 ?v8)))

(:action op_1 
        :parameters (?v5 - type_5 ?v6 - type_3 ?v2 - type_2)
        :precondition (and (pred_5 ?v2 ?v5) 
                           (pred_5 ?v6 ?v5))
        :effect (and (not (pred_5 ?v6 ?v5))
                     (pred_6 ?v2 ?v6)))

(:action op_2 
        :parameters (?v5 - type_5 ?v6 - type_3 ?v2 - type_2 ?v1 - type_4)
        :precondition (and (pred_5 ?v2 ?v5) 
		      	   (pred_5 ?v1 ?v5)
			   (pred_6 ?v2 ?v6)
			   (pred_3 ?v6)
			   (pred_1 ?v1))
        :effect (and (not (pred_1 ?v1))(not (pred_3 ?v6)) (pred_2 ?v1)))
)