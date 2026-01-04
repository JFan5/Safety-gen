(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v8)
		(pred_4 ?v7)
		(pred_5 ?v3)
		(pred_2 ?v3)
		(pred_1 ?v7 ?v3)
		(pred_3)
		(pred_6 ?v7))

   (:action op_1
       :parameters  (?v4 ?v6)
       :precondition (and (not-eq ?v4 ?v6) 
                          (pred_5 ?v4) (pred_5 ?v6) (pred_2 ?v4))
       :effect (and  (pred_2 ?v6)
		     (not (pred_2 ?v4))))


   (:action op_3
       :parameters (?v5 ?v1)
       :precondition  (and  (pred_4 ?v5) (pred_5 ?v1)
			    (pred_1 ?v5 ?v1) (pred_2 ?v1) (pred_3))
       :effect (and (pred_6 ?v5)
		    (not (pred_1 ?v5 ?v1)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v5  ?v1)
       :precondition  (and  (pred_4 ?v5) (pred_5 ?v1)
			    (pred_6 ?v5) (pred_2 ?v1))
       :effect (and (pred_1 ?v5 ?v1)
		    (pred_3)
		    (not (pred_6 ?v5)))))
