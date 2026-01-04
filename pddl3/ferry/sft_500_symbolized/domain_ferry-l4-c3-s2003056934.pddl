(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v5)
		(pred_2 ?v1)
		(pred_1 ?v8)
		(pred_3 ?v8)
		(pred_4 ?v1 ?v8)
		(pred_5)
		(pred_6 ?v1))

   (:action op_3
       :parameters  (?v2 ?v7)
       :precondition (and (not-eq ?v2 ?v7) 
                          (pred_1 ?v2) (pred_1 ?v7) (pred_3 ?v2))
       :effect (and  (pred_3 ?v7)
		     (not (pred_3 ?v2))))


   (:action op_2
       :parameters (?v6 ?v4)
       :precondition  (and  (pred_2 ?v6) (pred_1 ?v4)
			    (pred_4 ?v6 ?v4) (pred_3 ?v4) (pred_5))
       :effect (and (pred_6 ?v6)
		    (not (pred_4 ?v6 ?v4)) 
		    (not (pred_5))))

   (:action op_1
       :parameters  (?v6  ?v4)
       :precondition  (and  (pred_2 ?v6) (pred_1 ?v4)
			    (pred_6 ?v6) (pred_3 ?v4))
       :effect (and (pred_4 ?v6 ?v4)
		    (pred_5)
		    (not (pred_6 ?v6)))))
