(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v6)
		(pred_2 ?v2)
		(pred_5 ?v8)
		(pred_3 ?v8)
		(pred_4 ?v2 ?v8)
		(pred_1)
		(pred_6 ?v2))

   (:action op_2
       :parameters  (?v3 ?v7)
       :precondition (and (not-eq ?v3 ?v7) 
                          (pred_5 ?v3) (pred_5 ?v7) (pred_3 ?v3))
       :effect (and  (pred_3 ?v7)
		     (not (pred_3 ?v3))))


   (:action op_1
       :parameters (?v5 ?v4)
       :precondition  (and  (pred_2 ?v5) (pred_5 ?v4)
			    (pred_4 ?v5 ?v4) (pred_3 ?v4) (pred_1))
       :effect (and (pred_6 ?v5)
		    (not (pred_4 ?v5 ?v4)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v5  ?v4)
       :precondition  (and  (pred_2 ?v5) (pred_5 ?v4)
			    (pred_6 ?v5) (pred_3 ?v4))
       :effect (and (pred_4 ?v5 ?v4)
		    (pred_1)
		    (not (pred_6 ?v5)))))
