(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v2)
		(pred_3 ?v7)
		(pred_4 ?v1)
		(pred_2 ?v1)
		(pred_5 ?v7 ?v1)
		(pred_1)
		(pred_6 ?v7))

   (:action op_1
       :parameters  (?v3 ?v8)
       :precondition (and (not-eq ?v3 ?v8) 
                          (pred_4 ?v3) (pred_4 ?v8) (pred_2 ?v3))
       :effect (and  (pred_2 ?v8)
		     (not (pred_2 ?v3))))


   (:action op_2
       :parameters (?v6 ?v5)
       :precondition  (and  (pred_3 ?v6) (pred_4 ?v5)
			    (pred_5 ?v6 ?v5) (pred_2 ?v5) (pred_1))
       :effect (and (pred_6 ?v6)
		    (not (pred_5 ?v6 ?v5)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v6  ?v5)
       :precondition  (and  (pred_3 ?v6) (pred_4 ?v5)
			    (pred_6 ?v6) (pred_2 ?v5))
       :effect (and (pred_5 ?v6 ?v5)
		    (pred_1)
		    (not (pred_6 ?v6)))))
