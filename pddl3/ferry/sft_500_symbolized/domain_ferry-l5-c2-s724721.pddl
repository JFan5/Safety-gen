(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v7)
		(pred_5 ?v8)
		(pred_6 ?v6)
		(pred_3 ?v6)
		(pred_4 ?v8 ?v6)
		(pred_2)
		(pred_1 ?v8))

   (:action op_3
       :parameters  (?v1 ?v3)
       :precondition (and (not-eq ?v1 ?v3) 
                          (pred_6 ?v1) (pred_6 ?v3) (pred_3 ?v1))
       :effect (and  (pred_3 ?v3)
		     (not (pred_3 ?v1))))


   (:action op_2
       :parameters (?v2 ?v5)
       :precondition  (and  (pred_5 ?v2) (pred_6 ?v5)
			    (pred_4 ?v2 ?v5) (pred_3 ?v5) (pred_2))
       :effect (and (pred_1 ?v2)
		    (not (pred_4 ?v2 ?v5)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v2  ?v5)
       :precondition  (and  (pred_5 ?v2) (pred_6 ?v5)
			    (pred_1 ?v2) (pred_3 ?v5))
       :effect (and (pred_4 ?v2 ?v5)
		    (pred_2)
		    (not (pred_1 ?v2)))))
