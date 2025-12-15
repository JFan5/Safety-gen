(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_3 type_1 - object
	type_2 type_4 type_5 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v3 - type_1 ?v4 - type_3)
	(pred_5 ?v3 - type_2 ?v6 - type_5)
	(pred_6 ?v6 - type_5)
	(pred_4 ?v8 - type_3 ?v7 - type_3)
	(pred_3 ?v1 - type_4)
	(pred_2 ?v1 - type_4))                                                                                           
(:action op_3 
        :parameters (?v5 - type_3 ?v2 - type_3 ?v3 - type_2)
        :precondition (and (pred_1 ?v3 ?v5) 
                           (pred_4 ?v5 ?v2))                                                          
        :effect (and (not (pred_1 ?v3 ?v5)) (pred_1 ?v3 ?v2)))

(:action op_1 
        :parameters (?v4 - type_3 ?v6 - type_5 ?v3 - type_2)
        :precondition (and (pred_1 ?v3 ?v4) 
                           (pred_1 ?v6 ?v4))
        :effect (and (not (pred_1 ?v6 ?v4))
                     (pred_5 ?v3 ?v6)))

(:action op_2 
        :parameters (?v4 - type_3 ?v6 - type_5 ?v3 - type_2 ?v1 - type_4)
        :precondition (and (pred_1 ?v3 ?v4) 
		      	   (pred_1 ?v1 ?v4)
			   (pred_5 ?v3 ?v6)
			   (pred_6 ?v6)
			   (pred_2 ?v1))
        :effect (and (not (pred_2 ?v1))(not (pred_6 ?v6)) (pred_3 ?v1)))
)