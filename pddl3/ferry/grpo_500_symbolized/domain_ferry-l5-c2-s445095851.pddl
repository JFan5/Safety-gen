(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v8)
		(pred_6 ?v1)
		(pred_4 ?v7)
		(pred_3 ?v7)
		(pred_5 ?v1 ?v7)
		(pred_2)
		(pred_1 ?v1))

   (:action op_1
       :parameters  (?v4 ?v3)
       :precondition (and (not-eq ?v4 ?v3) 
                          (pred_4 ?v4) (pred_4 ?v3) (pred_3 ?v4))
       :effect (and  (pred_3 ?v3)
		     (not (pred_3 ?v4))))


   (:action op_3
       :parameters (?v5 ?v6)
       :precondition  (and  (pred_6 ?v5) (pred_4 ?v6)
			    (pred_5 ?v5 ?v6) (pred_3 ?v6) (pred_2))
       :effect (and (pred_1 ?v5)
		    (not (pred_5 ?v5 ?v6)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v5  ?v6)
       :precondition  (and  (pred_6 ?v5) (pred_4 ?v6)
			    (pred_1 ?v5) (pred_3 ?v6))
       :effect (and (pred_5 ?v5 ?v6)
		    (pred_2)
		    (not (pred_1 ?v5)))))
