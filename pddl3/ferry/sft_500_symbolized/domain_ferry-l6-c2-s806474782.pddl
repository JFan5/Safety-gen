(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v2)
		(pred_2 ?v8)
		(pred_6 ?v6)
		(pred_5 ?v6)
		(pred_1 ?v8 ?v6)
		(pred_4)
		(pred_3 ?v8))

   (:action op_3
       :parameters  (?v3 ?v1)
       :precondition (and (not-eq ?v3 ?v1) 
                          (pred_6 ?v3) (pred_6 ?v1) (pred_5 ?v3))
       :effect (and  (pred_5 ?v1)
		     (not (pred_5 ?v3))))


   (:action op_2
       :parameters (?v4 ?v5)
       :precondition  (and  (pred_2 ?v4) (pred_6 ?v5)
			    (pred_1 ?v4 ?v5) (pred_5 ?v5) (pred_4))
       :effect (and (pred_3 ?v4)
		    (not (pred_1 ?v4 ?v5)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v4  ?v5)
       :precondition  (and  (pred_2 ?v4) (pred_6 ?v5)
			    (pred_3 ?v4) (pred_5 ?v5))
       :effect (and (pred_1 ?v4 ?v5)
		    (pred_4)
		    (not (pred_3 ?v4)))))
