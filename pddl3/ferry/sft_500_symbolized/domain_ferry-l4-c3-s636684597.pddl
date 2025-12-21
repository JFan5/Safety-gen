(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v8)
		(pred_1 ?v2)
		(pred_6 ?v3)
		(pred_3 ?v3)
		(pred_2 ?v2 ?v3)
		(pred_4)
		(pred_5 ?v2))

   (:action op_2
       :parameters  (?v1 ?v4)
       :precondition (and (not-eq ?v1 ?v4) 
                          (pred_6 ?v1) (pred_6 ?v4) (pred_3 ?v1))
       :effect (and  (pred_3 ?v4)
		     (not (pred_3 ?v1))))


   (:action op_1
       :parameters (?v5 ?v6)
       :precondition  (and  (pred_1 ?v5) (pred_6 ?v6)
			    (pred_2 ?v5 ?v6) (pred_3 ?v6) (pred_4))
       :effect (and (pred_5 ?v5)
		    (not (pred_2 ?v5 ?v6)) 
		    (not (pred_4))))

   (:action op_3
       :parameters  (?v5  ?v6)
       :precondition  (and  (pred_1 ?v5) (pred_6 ?v6)
			    (pred_5 ?v5) (pred_3 ?v6))
       :effect (and (pred_2 ?v5 ?v6)
		    (pred_4)
		    (not (pred_5 ?v5)))))
