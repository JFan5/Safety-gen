(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v7)
		(pred_6 ?v1)
		(pred_3 ?v5)
		(pred_4 ?v5)
		(pred_1 ?v1 ?v5)
		(pred_5)
		(pred_2 ?v1))

   (:action op_3
       :parameters  (?v2 ?v8)
       :precondition (and (not-eq ?v2 ?v8) 
                          (pred_3 ?v2) (pred_3 ?v8) (pred_4 ?v2))
       :effect (and  (pred_4 ?v8)
		     (not (pred_4 ?v2))))


   (:action op_1
       :parameters (?v4 ?v6)
       :precondition  (and  (pred_6 ?v4) (pred_3 ?v6)
			    (pred_1 ?v4 ?v6) (pred_4 ?v6) (pred_5))
       :effect (and (pred_2 ?v4)
		    (not (pred_1 ?v4 ?v6)) 
		    (not (pred_5))))

   (:action op_2
       :parameters  (?v4  ?v6)
       :precondition  (and  (pred_6 ?v4) (pred_3 ?v6)
			    (pred_2 ?v4) (pred_4 ?v6))
       :effect (and (pred_1 ?v4 ?v6)
		    (pred_5)
		    (not (pred_2 ?v4)))))
