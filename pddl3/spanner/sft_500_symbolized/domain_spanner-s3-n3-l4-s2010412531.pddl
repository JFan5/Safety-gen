(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_5 type_1 type_4 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v1 - type_2 ?v2 - type_3)
	(pred_5 ?v1 - type_5 ?v6 - type_4)
	(pred_4 ?v6 - type_4)
	(pred_6 ?v4 - type_3 ?v3 - type_3)
	(pred_2 ?v8 - type_1)
	(pred_3 ?v8 - type_1))                                                                                           
(:action op_1 
        :parameters (?v5 - type_3 ?v7 - type_3 ?v1 - type_5)
        :precondition (and (pred_1 ?v1 ?v5) 
                           (pred_6 ?v5 ?v7))                                                          
        :effect (and (not (pred_1 ?v1 ?v5)) (pred_1 ?v1 ?v7)))

(:action op_3 
        :parameters (?v2 - type_3 ?v6 - type_4 ?v1 - type_5)
        :precondition (and (pred_1 ?v1 ?v2) 
                           (pred_1 ?v6 ?v2))
        :effect (and (not (pred_1 ?v6 ?v2))
                     (pred_5 ?v1 ?v6)))

(:action op_2 
        :parameters (?v2 - type_3 ?v6 - type_4 ?v1 - type_5 ?v8 - type_1)
        :precondition (and (pred_1 ?v1 ?v2) 
		      	   (pred_1 ?v8 ?v2)
			   (pred_5 ?v1 ?v6)
			   (pred_4 ?v6)
			   (pred_3 ?v8))
        :effect (and (not (pred_3 ?v8))(not (pred_4 ?v6)) (pred_2 ?v8)))
)