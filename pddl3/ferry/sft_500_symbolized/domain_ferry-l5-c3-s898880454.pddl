(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v8)
		(pred_3 ?v1)
		(pred_4 ?v3)
		(pred_2 ?v3)
		(pred_5 ?v1 ?v3)
		(pred_1)
		(pred_6 ?v1))

   (:action op_2
       :parameters  (?v5 ?v6)
       :precondition (and (not-eq ?v5 ?v6) 
                          (pred_4 ?v5) (pred_4 ?v6) (pred_2 ?v5))
       :effect (and  (pred_2 ?v6)
		     (not (pred_2 ?v5))))


   (:action op_1
       :parameters (?v2 ?v4)
       :precondition  (and  (pred_3 ?v2) (pred_4 ?v4)
			    (pred_5 ?v2 ?v4) (pred_2 ?v4) (pred_1))
       :effect (and (pred_6 ?v2)
		    (not (pred_5 ?v2 ?v4)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v2  ?v4)
       :precondition  (and  (pred_3 ?v2) (pred_4 ?v4)
			    (pred_6 ?v2) (pred_2 ?v4))
       :effect (and (pred_5 ?v2 ?v4)
		    (pred_1)
		    (not (pred_6 ?v2)))))
