(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v3)
		(pred_5 ?v5)
		(pred_4 ?v8)
		(pred_6 ?v8)
		(pred_3 ?v5 ?v8)
		(pred_2)
		(pred_1 ?v5))

   (:action op_3
       :parameters  (?v1 ?v2)
       :precondition (and (not-eq ?v1 ?v2) 
                          (pred_4 ?v1) (pred_4 ?v2) (pred_6 ?v1))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v1))))


   (:action op_2
       :parameters (?v6 ?v4)
       :precondition  (and  (pred_5 ?v6) (pred_4 ?v4)
			    (pred_3 ?v6 ?v4) (pred_6 ?v4) (pred_2))
       :effect (and (pred_1 ?v6)
		    (not (pred_3 ?v6 ?v4)) 
		    (not (pred_2))))

   (:action op_1
       :parameters  (?v6  ?v4)
       :precondition  (and  (pred_5 ?v6) (pred_4 ?v4)
			    (pred_1 ?v6) (pred_6 ?v4))
       :effect (and (pred_3 ?v6 ?v4)
		    (pred_2)
		    (not (pred_1 ?v6)))))
