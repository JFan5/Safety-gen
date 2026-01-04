(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_4 type_1 - object
	type_5 type_3 type_2 - type_1	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v1 - type_1 ?v7 - type_4)
	(pred_2 ?v1 - type_5 ?v3 - type_2)
	(pred_1 ?v3 - type_2)
	(pred_6 ?v4 - type_4 ?v2 - type_4)
	(pred_5 ?v6 - type_3)
	(pred_4 ?v6 - type_3))                                                                                           
(:action op_1 
        :parameters (?v5 - type_4 ?v8 - type_4 ?v1 - type_5)
        :precondition (and (pred_3 ?v1 ?v5) 
                           (pred_6 ?v5 ?v8))                                                          
        :effect (and (not (pred_3 ?v1 ?v5)) (pred_3 ?v1 ?v8)))

(:action op_2 
        :parameters (?v7 - type_4 ?v3 - type_2 ?v1 - type_5)
        :precondition (and (pred_3 ?v1 ?v7) 
                           (pred_3 ?v3 ?v7))
        :effect (and (not (pred_3 ?v3 ?v7))
                     (pred_2 ?v1 ?v3)))

(:action op_3 
        :parameters (?v7 - type_4 ?v3 - type_2 ?v1 - type_5 ?v6 - type_3)
        :precondition (and (pred_3 ?v1 ?v7) 
		      	   (pred_3 ?v6 ?v7)
			   (pred_2 ?v1 ?v3)
			   (pred_1 ?v3)
			   (pred_4 ?v6))
        :effect (and (not (pred_4 ?v6))(not (pred_1 ?v3)) (pred_5 ?v6)))
)