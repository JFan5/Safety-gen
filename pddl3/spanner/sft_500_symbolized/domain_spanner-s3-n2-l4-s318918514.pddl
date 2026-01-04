(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_2 type_4 type_1 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v6 - type_3 ?v8 - type_5)
	(pred_1 ?v6 - type_2 ?v2 - type_1)
	(pred_6 ?v2 - type_1)
	(pred_4 ?v4 - type_5 ?v7 - type_5)
	(pred_5 ?v3 - type_4)
	(pred_2 ?v3 - type_4))                                                                                           
(:action op_1 
        :parameters (?v5 - type_5 ?v1 - type_5 ?v6 - type_2)
        :precondition (and (pred_3 ?v6 ?v5) 
                           (pred_4 ?v5 ?v1))                                                          
        :effect (and (not (pred_3 ?v6 ?v5)) (pred_3 ?v6 ?v1)))

(:action op_2 
        :parameters (?v8 - type_5 ?v2 - type_1 ?v6 - type_2)
        :precondition (and (pred_3 ?v6 ?v8) 
                           (pred_3 ?v2 ?v8))
        :effect (and (not (pred_3 ?v2 ?v8))
                     (pred_1 ?v6 ?v2)))

(:action op_3 
        :parameters (?v8 - type_5 ?v2 - type_1 ?v6 - type_2 ?v3 - type_4)
        :precondition (and (pred_3 ?v6 ?v8) 
		      	   (pred_3 ?v3 ?v8)
			   (pred_1 ?v6 ?v2)
			   (pred_6 ?v2)
			   (pred_2 ?v3))
        :effect (and (not (pred_2 ?v3))(not (pred_6 ?v2)) (pred_5 ?v3)))
)