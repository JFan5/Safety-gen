(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v2)
		(pred_5 ?v1)
		(pred_6 ?v8)
		(pred_2 ?v8)
		(pred_1 ?v1 ?v8)
		(pred_3)
		(pred_4 ?v1))

   (:action op_1
       :parameters  (?v3 ?v5)
       :precondition (and (not-eq ?v3 ?v5) 
                          (pred_6 ?v3) (pred_6 ?v5) (pred_2 ?v3))
       :effect (and  (pred_2 ?v5)
		     (not (pred_2 ?v3))))


   (:action op_2
       :parameters (?v6 ?v4)
       :precondition  (and  (pred_5 ?v6) (pred_6 ?v4)
			    (pred_1 ?v6 ?v4) (pred_2 ?v4) (pred_3))
       :effect (and (pred_4 ?v6)
		    (not (pred_1 ?v6 ?v4)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v6  ?v4)
       :precondition  (and  (pred_5 ?v6) (pred_6 ?v4)
			    (pred_4 ?v6) (pred_2 ?v4))
       :effect (and (pred_1 ?v6 ?v4)
		    (pred_3)
		    (not (pred_4 ?v6)))))
