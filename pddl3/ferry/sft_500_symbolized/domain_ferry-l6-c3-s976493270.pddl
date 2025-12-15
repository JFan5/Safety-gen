(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_6 ?v3)
		(pred_4 ?v6)
		(pred_1 ?v6)
		(pred_2 ?v3 ?v6)
		(pred_5)
		(pred_3 ?v3))

   (:action op_2
       :parameters  (?v2 ?v4)
       :precondition (and (not-eq ?v2 ?v4) 
                          (pred_4 ?v2) (pred_4 ?v4) (pred_1 ?v2))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v2))))


   (:action op_3
       :parameters (?v7 ?v5)
       :precondition  (and  (pred_6 ?v7) (pred_4 ?v5)
			    (pred_2 ?v7 ?v5) (pred_1 ?v5) (pred_5))
       :effect (and (pred_3 ?v7)
		    (not (pred_2 ?v7 ?v5)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v7  ?v5)
       :precondition  (and  (pred_6 ?v7) (pred_4 ?v5)
			    (pred_3 ?v7) (pred_1 ?v5))
       :effect (and (pred_2 ?v7 ?v5)
		    (pred_5)
		    (not (pred_3 ?v7)))))
