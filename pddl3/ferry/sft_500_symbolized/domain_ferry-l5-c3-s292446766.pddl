(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v4)
		(pred_6 ?v7)
		(pred_5 ?v8)
		(pred_4 ?v8)
		(pred_3 ?v7 ?v8)
		(pred_2)
		(pred_1 ?v7))

   (:action op_2
       :parameters  (?v5 ?v1)
       :precondition (and (not-eq ?v5 ?v1) 
                          (pred_5 ?v5) (pred_5 ?v1) (pred_4 ?v5))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v5))))


   (:action op_1
       :parameters (?v2 ?v6)
       :precondition  (and  (pred_6 ?v2) (pred_5 ?v6)
			    (pred_3 ?v2 ?v6) (pred_4 ?v6) (pred_2))
       :effect (and (pred_1 ?v2)
		    (not (pred_3 ?v2 ?v6)) 
		    (not (pred_2))))

   (:action op_3
       :parameters  (?v2  ?v6)
       :precondition  (and  (pred_6 ?v2) (pred_5 ?v6)
			    (pred_1 ?v2) (pred_4 ?v6))
       :effect (and (pred_3 ?v2 ?v6)
		    (pred_2)
		    (not (pred_1 ?v2)))))
