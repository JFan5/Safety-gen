(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_4 ?v4)
		(pred_6 ?v7)
		(pred_2 ?v7)
		(pred_3 ?v4 ?v7)
		(pred_5)
		(pred_1 ?v4))

   (:action op_1
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_6 ?v2) (pred_6 ?v6) (pred_2 ?v2))
       :effect (and  (pred_2 ?v6)
		     (not (pred_2 ?v2))))


   (:action op_3
       :parameters (?v1 ?v5)
       :precondition  (and  (pred_4 ?v1) (pred_6 ?v5)
			    (pred_3 ?v1 ?v5) (pred_2 ?v5) (pred_5))
       :effect (and (pred_1 ?v1)
		    (not (pred_3 ?v1 ?v5)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v1  ?v5)
       :precondition  (and  (pred_4 ?v1) (pred_6 ?v5)
			    (pred_1 ?v1) (pred_2 ?v5))
       :effect (and (pred_3 ?v1 ?v5)
		    (pred_5)
		    (not (pred_1 ?v1)))))
