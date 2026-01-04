(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v3)
		(pred_3 ?v2)
		(pred_1 ?v8)
		(pred_4 ?v8)
		(pred_6 ?v2 ?v8)
		(pred_2)
		(pred_5 ?v2))

   (:action op_3
       :parameters  (?v1 ?v6)
       :precondition (and (not-eq ?v1 ?v6) 
                          (pred_1 ?v1) (pred_1 ?v6) (pred_4 ?v1))
       :effect (and  (pred_4 ?v6)
		     (not (pred_4 ?v1))))


   (:action op_2
       :parameters (?v5 ?v4)
       :precondition  (and  (pred_3 ?v5) (pred_1 ?v4)
			    (pred_6 ?v5 ?v4) (pred_4 ?v4) (pred_2))
       :effect (and (pred_5 ?v5)
		    (not (pred_6 ?v5 ?v4)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v5  ?v4)
       :precondition  (and  (pred_3 ?v5) (pred_1 ?v4)
			    (pred_5 ?v5) (pred_4 ?v4))
       :effect (and (pred_6 ?v5 ?v4)
		    (pred_2)
		    (not (pred_5 ?v5)))))
