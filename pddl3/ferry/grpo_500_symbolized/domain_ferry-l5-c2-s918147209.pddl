(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v6 ?v8)
		(pred_1 ?v7)
		(pred_4 ?v2)
		(pred_2 ?v2)
		(pred_6 ?v7 ?v2)
		(pred_3)
		(pred_5 ?v7))

   (:action op_1
       :parameters  (?v3 ?v1)
       :precondition (and (not-eq ?v3 ?v1) 
                          (pred_4 ?v3) (pred_4 ?v1) (pred_2 ?v3))
       :effect (and  (pred_2 ?v1)
		     (not (pred_2 ?v3))))


   (:action op_3
       :parameters (?v5 ?v4)
       :precondition  (and  (pred_1 ?v5) (pred_4 ?v4)
			    (pred_6 ?v5 ?v4) (pred_2 ?v4) (pred_3))
       :effect (and (pred_5 ?v5)
		    (not (pred_6 ?v5 ?v4)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v5  ?v4)
       :precondition  (and  (pred_1 ?v5) (pred_4 ?v4)
			    (pred_5 ?v5) (pred_2 ?v4))
       :effect (and (pred_6 ?v5 ?v4)
		    (pred_3)
		    (not (pred_5 ?v5)))))
