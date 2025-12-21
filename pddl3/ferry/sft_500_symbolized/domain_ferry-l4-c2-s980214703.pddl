(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v7)
		(pred_2 ?v8)
		(pred_1 ?v1)
		(pred_4 ?v1)
		(pred_3 ?v8 ?v1)
		(pred_5)
		(pred_6 ?v8))

   (:action op_1
       :parameters  (?v3 ?v2)
       :precondition (and (not-eq ?v3 ?v2) 
                          (pred_1 ?v3) (pred_1 ?v2) (pred_4 ?v3))
       :effect (and  (pred_4 ?v2)
		     (not (pred_4 ?v3))))


   (:action op_3
       :parameters (?v6 ?v5)
       :precondition  (and  (pred_2 ?v6) (pred_1 ?v5)
			    (pred_3 ?v6 ?v5) (pred_4 ?v5) (pred_5))
       :effect (and (pred_6 ?v6)
		    (not (pred_3 ?v6 ?v5)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v6  ?v5)
       :precondition  (and  (pred_2 ?v6) (pred_1 ?v5)
			    (pred_6 ?v6) (pred_4 ?v5))
       :effect (and (pred_3 ?v6 ?v5)
		    (pred_5)
		    (not (pred_6 ?v6)))))
