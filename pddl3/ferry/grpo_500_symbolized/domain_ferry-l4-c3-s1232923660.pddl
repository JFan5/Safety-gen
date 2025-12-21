(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v7)
		(pred_2 ?v8)
		(pred_3 ?v2)
		(pred_1 ?v2)
		(pred_6 ?v8 ?v2)
		(pred_5)
		(pred_4 ?v8))

   (:action op_3
       :parameters  (?v4 ?v3)
       :precondition (and (not-eq ?v4 ?v3) 
                          (pred_3 ?v4) (pred_3 ?v3) (pred_1 ?v4))
       :effect (and  (pred_1 ?v3)
		     (not (pred_1 ?v4))))


   (:action op_1
       :parameters (?v6 ?v5)
       :precondition  (and  (pred_2 ?v6) (pred_3 ?v5)
			    (pred_6 ?v6 ?v5) (pred_1 ?v5) (pred_5))
       :effect (and (pred_4 ?v6)
		    (not (pred_6 ?v6 ?v5)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v6  ?v5)
       :precondition  (and  (pred_2 ?v6) (pred_3 ?v5)
			    (pred_4 ?v6) (pred_1 ?v5))
       :effect (and (pred_6 ?v6 ?v5)
		    (pred_5)
		    (not (pred_4 ?v6)))))
