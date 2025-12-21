(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v7)
		(pred_1 ?v4)
		(pred_4 ?v1)
		(pred_3 ?v1)
		(pred_6 ?v4 ?v1)
		(pred_2)
		(pred_5 ?v4))

   (:action op_2
       :parameters  (?v3 ?v8)
       :precondition (and (not-eq ?v3 ?v8) 
                          (pred_4 ?v3) (pred_4 ?v8) (pred_3 ?v3))
       :effect (and  (pred_3 ?v8)
		     (not (pred_3 ?v3))))


   (:action op_1
       :parameters (?v2 ?v5)
       :precondition  (and  (pred_1 ?v2) (pred_4 ?v5)
			    (pred_6 ?v2 ?v5) (pred_3 ?v5) (pred_2))
       :effect (and (pred_5 ?v2)
		    (not (pred_6 ?v2 ?v5)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v2  ?v5)
       :precondition  (and  (pred_1 ?v2) (pred_4 ?v5)
			    (pred_5 ?v2) (pred_3 ?v5))
       :effect (and (pred_6 ?v2 ?v5)
		    (pred_2)
		    (not (pred_5 ?v2)))))
