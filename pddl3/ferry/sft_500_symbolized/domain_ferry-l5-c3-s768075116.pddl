(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v8)
		(pred_5 ?v6)
		(pred_3 ?v7)
		(pred_6 ?v7)
		(pred_1 ?v6 ?v7)
		(pred_2)
		(pred_4 ?v6))

   (:action op_3
       :parameters  (?v2 ?v1)
       :precondition (and (not-eq ?v2 ?v1) 
                          (pred_3 ?v2) (pred_3 ?v1) (pred_6 ?v2))
       :effect (and  (pred_6 ?v1)
		     (not (pred_6 ?v2))))


   (:action op_2
       :parameters (?v3 ?v5)
       :precondition  (and  (pred_5 ?v3) (pred_3 ?v5)
			    (pred_1 ?v3 ?v5) (pred_6 ?v5) (pred_2))
       :effect (and (pred_4 ?v3)
		    (not (pred_1 ?v3 ?v5)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v3  ?v5)
       :precondition  (and  (pred_5 ?v3) (pred_3 ?v5)
			    (pred_4 ?v3) (pred_6 ?v5))
       :effect (and (pred_1 ?v3 ?v5)
		    (pred_2)
		    (not (pred_4 ?v3)))))
