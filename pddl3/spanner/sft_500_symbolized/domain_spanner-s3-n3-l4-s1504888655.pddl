(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_5 type_3 - object
	type_4 type_1 type_2 - type_3	
)                                           
                                                                               
(:predicates 
	(pred_1 ?v3 - type_3 ?v7 - type_5)
	(pred_6 ?v3 - type_4 ?v6 - type_2)
	(pred_4 ?v6 - type_2)
	(pred_5 ?v2 - type_5 ?v4 - type_5)
	(pred_2 ?v8 - type_1)
	(pred_3 ?v8 - type_1))                                                                                           
(:action op_2 
        :parameters (?v5 - type_5 ?v1 - type_5 ?v3 - type_4)
        :precondition (and (pred_1 ?v3 ?v5) 
                           (pred_5 ?v5 ?v1))                                                          
        :effect (and (not (pred_1 ?v3 ?v5)) (pred_1 ?v3 ?v1)))

(:action op_1 
        :parameters (?v7 - type_5 ?v6 - type_2 ?v3 - type_4)
        :precondition (and (pred_1 ?v3 ?v7) 
                           (pred_1 ?v6 ?v7))
        :effect (and (not (pred_1 ?v6 ?v7))
                     (pred_6 ?v3 ?v6)))

(:action op_3 
        :parameters (?v7 - type_5 ?v6 - type_2 ?v3 - type_4 ?v8 - type_1)
        :precondition (and (pred_1 ?v3 ?v7) 
		      	   (pred_1 ?v8 ?v7)
			   (pred_6 ?v3 ?v6)
			   (pred_4 ?v6)
			   (pred_3 ?v8))
        :effect (and (not (pred_3 ?v8))(not (pred_4 ?v6)) (pred_2 ?v8)))
)