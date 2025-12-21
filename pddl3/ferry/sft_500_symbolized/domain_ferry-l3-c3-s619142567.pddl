(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v7)
		(pred_6 ?v3)
		(pred_5 ?v8)
		(pred_3 ?v8)
		(pred_4 ?v3 ?v8)
		(pred_1)
		(pred_2 ?v3))

   (:action op_1
       :parameters  (?v5 ?v1)
       :precondition (and (not-eq ?v5 ?v1) 
                          (pred_5 ?v5) (pred_5 ?v1) (pred_3 ?v5))
       :effect (and  (pred_3 ?v1)
		     (not (pred_3 ?v5))))


   (:action op_3
       :parameters (?v6 ?v4)
       :precondition  (and  (pred_6 ?v6) (pred_5 ?v4)
			    (pred_4 ?v6 ?v4) (pred_3 ?v4) (pred_1))
       :effect (and (pred_2 ?v6)
		    (not (pred_4 ?v6 ?v4)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v6  ?v4)
       :precondition  (and  (pred_6 ?v6) (pred_5 ?v4)
			    (pred_2 ?v6) (pred_3 ?v4))
       :effect (and (pred_4 ?v6 ?v4)
		    (pred_1)
		    (not (pred_2 ?v6)))))
