(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v7)
		(pred_6 ?v8)
		(pred_2 ?v6)
		(pred_4 ?v6)
		(pred_1 ?v8 ?v6)
		(pred_3)
		(pred_5 ?v8))

   (:action op_3
       :parameters  (?v2 ?v1)
       :precondition (and (not-eq ?v2 ?v1) 
                          (pred_2 ?v2) (pred_2 ?v1) (pred_4 ?v2))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v2))))


   (:action op_1
       :parameters (?v3 ?v5)
       :precondition  (and  (pred_6 ?v3) (pred_2 ?v5)
			    (pred_1 ?v3 ?v5) (pred_4 ?v5) (pred_3))
       :effect (and (pred_5 ?v3)
		    (not (pred_1 ?v3 ?v5)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v3  ?v5)
       :precondition  (and  (pred_6 ?v3) (pred_2 ?v5)
			    (pred_5 ?v3) (pred_4 ?v5))
       :effect (and (pred_1 ?v3 ?v5)
		    (pred_3)
		    (not (pred_5 ?v3)))))
