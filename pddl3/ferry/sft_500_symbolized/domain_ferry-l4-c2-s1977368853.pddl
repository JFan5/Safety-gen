(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_2 ?v2)
		(pred_4 ?v4)
		(pred_6 ?v4)
		(pred_3 ?v2 ?v4)
		(pred_5)
		(pred_1 ?v2))

   (:action op_1
       :parameters  (?v3 ?v5)
       :precondition (and (not-eq ?v3 ?v5) 
                          (pred_4 ?v3) (pred_4 ?v5) (pred_6 ?v3))
       :effect (and  (pred_6 ?v5)
		     (not (pred_6 ?v3))))


   (:action op_2
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_2 ?v7) (pred_4 ?v6)
			    (pred_3 ?v7 ?v6) (pred_6 ?v6) (pred_5))
       :effect (and (pred_1 ?v7)
		    (not (pred_3 ?v7 ?v6)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_2 ?v7) (pred_4 ?v6)
			    (pred_1 ?v7) (pred_6 ?v6))
       :effect (and (pred_3 ?v7 ?v6)
		    (pred_5)
		    (not (pred_1 ?v7)))))
