(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v3)
		(pred_6 ?v8)
		(pred_4 ?v1)
		(pred_1 ?v1)
		(pred_3 ?v8 ?v1)
		(pred_5)
		(pred_2 ?v8))

   (:action op_3
       :parameters  (?v2 ?v7)
       :precondition (and (not-eq ?v2 ?v7) 
                          (pred_4 ?v2) (pred_4 ?v7) (pred_1 ?v2))
       :effect (and  (pred_1 ?v7)
		     (not (pred_1 ?v2))))


   (:action op_1
       :parameters (?v5 ?v6)
       :precondition  (and  (pred_6 ?v5) (pred_4 ?v6)
			    (pred_3 ?v5 ?v6) (pred_1 ?v6) (pred_5))
       :effect (and (pred_2 ?v5)
		    (not (pred_3 ?v5 ?v6)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v5  ?v6)
       :precondition  (and  (pred_6 ?v5) (pred_4 ?v6)
			    (pred_2 ?v5) (pred_1 ?v6))
       :effect (and (pred_3 ?v5 ?v6)
		    (pred_5)
		    (not (pred_2 ?v5)))))
