(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v7)
		(pred_5 ?v6)
		(pred_4 ?v2)
		(pred_1 ?v2)
		(pred_6 ?v6 ?v2)
		(pred_2)
		(pred_3 ?v6))

   (:action op_1
       :parameters  (?v3 ?v4)
       :precondition (and (not-eq ?v3 ?v4) 
                          (pred_4 ?v3) (pred_4 ?v4) (pred_1 ?v3))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v3))))


   (:action op_3
       :parameters (?v8 ?v5)
       :precondition  (and  (pred_5 ?v8) (pred_4 ?v5)
			    (pred_6 ?v8 ?v5) (pred_1 ?v5) (pred_2))
       :effect (and (pred_3 ?v8)
		    (not (pred_6 ?v8 ?v5)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v8  ?v5)
       :precondition  (and  (pred_5 ?v8) (pred_4 ?v5)
			    (pred_3 ?v8) (pred_1 ?v5))
       :effect (and (pred_6 ?v8 ?v5)
		    (pred_2)
		    (not (pred_3 ?v8)))))
