(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_5 - object
	type_2 type_1 type_3 - type_5	
)                                           
                                                                               
(:predicates 
	(pred_6 ?v3 - type_5 ?v5 - type_4)
	(pred_2 ?v3 - type_2 ?v6 - type_3)
	(pred_4 ?v6 - type_3)
	(pred_5 ?v1 - type_4 ?v4 - type_4)
	(pred_3 ?v8 - type_1)
	(pred_1 ?v8 - type_1))                                                                                           
(:action op_1 
        :parameters (?v2 - type_4 ?v7 - type_4 ?v3 - type_2)
        :precondition (and (pred_6 ?v3 ?v2) 
                           (pred_5 ?v2 ?v7))                                                          
        :effect (and (not (pred_6 ?v3 ?v2)) (pred_6 ?v3 ?v7)))

(:action op_2 
        :parameters (?v5 - type_4 ?v6 - type_3 ?v3 - type_2)
        :precondition (and (pred_6 ?v3 ?v5) 
                           (pred_6 ?v6 ?v5))
        :effect (and (not (pred_6 ?v6 ?v5))
                     (pred_2 ?v3 ?v6)))

(:action op_3 
        :parameters (?v5 - type_4 ?v6 - type_3 ?v3 - type_2 ?v8 - type_1)
        :precondition (and (pred_6 ?v3 ?v5) 
		      	   (pred_6 ?v8 ?v5)
			   (pred_2 ?v3 ?v6)
			   (pred_4 ?v6)
			   (pred_1 ?v8))
        :effect (and (not (pred_1 ?v8))(not (pred_4 ?v6)) (pred_3 ?v8)))
)