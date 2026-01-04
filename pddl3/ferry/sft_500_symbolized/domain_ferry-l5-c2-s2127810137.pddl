(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_2 ?v5)
		(pred_1 ?v7)
		(pred_6 ?v7)
		(pred_4 ?v5 ?v7)
		(pred_3)
		(pred_5 ?v5))

   (:action op_2
       :parameters  (?v3 ?v8)
       :precondition (and (not-eq ?v3 ?v8) 
                          (pred_1 ?v3) (pred_1 ?v8) (pred_6 ?v3))
       :effect (and  (pred_6 ?v8)
		     (not (pred_6 ?v3))))


   (:action op_3
       :parameters (?v6 ?v4)
       :precondition  (and  (pred_2 ?v6) (pred_1 ?v4)
			    (pred_4 ?v6 ?v4) (pred_6 ?v4) (pred_3))
       :effect (and (pred_5 ?v6)
		    (not (pred_4 ?v6 ?v4)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v6  ?v4)
       :precondition  (and  (pred_2 ?v6) (pred_1 ?v4)
			    (pred_5 ?v6) (pred_6 ?v4))
       :effect (and (pred_4 ?v6 ?v4)
		    (pred_3)
		    (not (pred_5 ?v6)))))
