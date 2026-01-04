(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v8)
		(pred_4 ?v7)
		(pred_1 ?v2)
		(pred_2 ?v2)
		(pred_3 ?v7 ?v2)
		(pred_5)
		(pred_6 ?v7))

   (:action op_3
       :parameters  (?v3 ?v5)
       :precondition (and (not-eq ?v3 ?v5) 
                          (pred_1 ?v3) (pred_1 ?v5) (pred_2 ?v3))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v3))))


   (:action op_1
       :parameters (?v6 ?v4)
       :precondition  (and  (pred_4 ?v6) (pred_1 ?v4)
			    (pred_3 ?v6 ?v4) (pred_2 ?v4) (pred_5))
       :effect (and (pred_6 ?v6)
		    (not (pred_3 ?v6 ?v4)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v6  ?v4)
       :precondition  (and  (pred_4 ?v6) (pred_1 ?v4)
			    (pred_6 ?v6) (pred_2 ?v4))
       :effect (and (pred_3 ?v6 ?v4)
		    (pred_5)
		    (not (pred_6 ?v6)))))
