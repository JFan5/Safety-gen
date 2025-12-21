(define (domain spanner)                    
(:requirements :typing :strips :constraints)      

(:types 
	type_1 type_2 - object
	type_4 type_3 type_5 - type_2	
)                                           
                                                                               
(:predicates 
	(pred_3 ?v8 - type_2 ?v3 - type_1)
	(pred_6 ?v8 - type_4 ?v6 - type_5)
	(pred_5 ?v6 - type_5)
	(pred_4 ?v7 - type_1 ?v5 - type_1)
	(pred_2 ?v4 - type_3)
	(pred_1 ?v4 - type_3))                                                                                           
(:action op_3 
        :parameters (?v2 - type_1 ?v1 - type_1 ?v8 - type_4)
        :precondition (and (pred_3 ?v8 ?v2) 
                           (pred_4 ?v2 ?v1))                                                          
        :effect (and (not (pred_3 ?v8 ?v2)) (pred_3 ?v8 ?v1)))

(:action op_2 
        :parameters (?v3 - type_1 ?v6 - type_5 ?v8 - type_4)
        :precondition (and (pred_3 ?v8 ?v3) 
                           (pred_3 ?v6 ?v3))
        :effect (and (not (pred_3 ?v6 ?v3))
                     (pred_6 ?v8 ?v6)))

(:action op_1 
        :parameters (?v3 - type_1 ?v6 - type_5 ?v8 - type_4 ?v4 - type_3)
        :precondition (and (pred_3 ?v8 ?v3) 
		      	   (pred_3 ?v4 ?v3)
			   (pred_6 ?v8 ?v6)
			   (pred_5 ?v6)
			   (pred_1 ?v4))
        :effect (and (not (pred_1 ?v4))(not (pred_5 ?v6)) (pred_2 ?v4)))
)