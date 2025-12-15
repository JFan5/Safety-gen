(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_1 ?v5)
		(pred_6 ?v7)
		(pred_4 ?v7)
		(pred_3 ?v5 ?v7)
		(pred_2)
		(pred_5 ?v5))

   (:action op_3
       :parameters  (?v6 ?v3)
       :precondition (and (not-eq ?v6 ?v3) 
                          (pred_6 ?v6) (pred_6 ?v3) (pred_4 ?v6))
       :effect (and  (pred_4 ?v3)
		     (not (pred_4 ?v6))))


   (:action op_1
       :parameters (?v2 ?v4)
       :precondition  (and  (pred_1 ?v2) (pred_6 ?v4)
			    (pred_3 ?v2 ?v4) (pred_4 ?v4) (pred_2))
       :effect (and (pred_5 ?v2)
		    (not (pred_3 ?v2 ?v4)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v2  ?v4)
       :precondition  (and  (pred_1 ?v2) (pred_6 ?v4)
			    (pred_5 ?v2) (pred_4 ?v4))
       :effect (and (pred_3 ?v2 ?v4)
		    (pred_2)
		    (not (pred_5 ?v2)))))
