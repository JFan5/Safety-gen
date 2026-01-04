(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_2 - object
	type_4 type_1 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v6 - type_2 ?v8 - type_3)
	(pred_4 ?v6 - type_4 ?v1 - type_5)
	(pred_5 ?v1 - type_5)
	(pred_3 ?v7 - type_3 ?v4 - type_3)
	(pred_6 ?v3 - type_1)
	(pred_2 ?v3 - type_1))                                                                                           
(:action op_1 
        :parameters (?v5 - type_3 ?v2 - type_3 ?v6 - type_4)
        :precondition (and (pred_1 ?v6 ?v5) 
                           (pred_3 ?v5 ?v2))                                                          
        :effect (and (not (pred_1 ?v6 ?v5)) (pred_1 ?v6 ?v2)))

(:action op_2 
        :parameters (?v8 - type_3 ?v1 - type_5 ?v6 - type_4)
        :precondition (and (pred_1 ?v6 ?v8) 
                           (pred_1 ?v1 ?v8))
        :effect (and (not (pred_1 ?v1 ?v8))
                     (pred_4 ?v6 ?v1)))

(:action op_3 
        :parameters (?v8 - type_3 ?v1 - type_5 ?v6 - type_4 ?v3 - type_1)
        :precondition (and (pred_1 ?v6 ?v8) 
		      	   (pred_1 ?v3 ?v8)
			   (pred_4 ?v6 ?v1)
			   (pred_5 ?v1)
			   (pred_2 ?v3))
        :effect (and (not (pred_2 ?v3))(not (pred_5 ?v1)) (pred_6 ?v3)))
)