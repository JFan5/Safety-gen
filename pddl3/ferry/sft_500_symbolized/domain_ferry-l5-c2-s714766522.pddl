(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v1)
		(pred_4 ?v5)
		(pred_6 ?v3)
		(pred_2 ?v3)
		(pred_1 ?v5 ?v3)
		(pred_5)
		(pred_3 ?v5))

   (:action op_3
       :parameters  (?v2 ?v8)
       :precondition (and (not-eq ?v2 ?v8) 
                          (pred_6 ?v2) (pred_6 ?v8) (pred_2 ?v2))
       :effect (and  (pred_2 ?v8)
		     (not (pred_2 ?v2))))


   (:action op_2
       :parameters (?v6 ?v4)
       :precondition  (and  (pred_4 ?v6) (pred_6 ?v4)
			    (pred_1 ?v6 ?v4) (pred_2 ?v4) (pred_5))
       :effect (and (pred_3 ?v6)
		    (not (pred_1 ?v6 ?v4)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v6  ?v4)
       :precondition  (and  (pred_4 ?v6) (pred_6 ?v4)
			    (pred_3 ?v6) (pred_2 ?v4))
       :effect (and (pred_1 ?v6 ?v4)
		    (pred_5)
		    (not (pred_3 ?v6)))))
