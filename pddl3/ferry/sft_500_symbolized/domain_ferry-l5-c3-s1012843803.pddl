(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v4)
		(pred_5 ?v3)
		(pred_6 ?v7)
		(pred_1 ?v7)
		(pred_4 ?v3 ?v7)
		(pred_2)
		(pred_3 ?v3))

   (:action op_3
       :parameters  (?v5 ?v2)
       :precondition (and (not-eq ?v5 ?v2) 
                          (pred_6 ?v5) (pred_6 ?v2) (pred_1 ?v5))
       :effect (and  (pred_1 ?v2)
		     (not (pred_1 ?v5))))


   (:action op_2
       :parameters (?v1 ?v8)
       :precondition  (and  (pred_5 ?v1) (pred_6 ?v8)
			    (pred_4 ?v1 ?v8) (pred_1 ?v8) (pred_2))
       :effect (and (pred_3 ?v1)
		    (not (pred_4 ?v1 ?v8)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v1  ?v8)
       :precondition  (and  (pred_5 ?v1) (pred_6 ?v8)
			    (pred_3 ?v1) (pred_1 ?v8))
       :effect (and (pred_4 ?v1 ?v8)
		    (pred_2)
		    (not (pred_3 ?v1)))))
