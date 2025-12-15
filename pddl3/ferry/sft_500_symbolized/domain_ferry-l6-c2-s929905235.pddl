(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v1)
		(pred_1 ?v8)
		(pred_3 ?v3)
		(pred_6 ?v3)
		(pred_2 ?v8 ?v3)
		(pred_5)
		(pred_4 ?v8))

   (:action op_2
       :parameters  (?v6 ?v2)
       :precondition (and (not-eq ?v6 ?v2) 
                          (pred_3 ?v6) (pred_3 ?v2) (pred_6 ?v6))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v6))))


   (:action op_1
       :parameters (?v5 ?v4)
       :precondition  (and  (pred_1 ?v5) (pred_3 ?v4)
			    (pred_2 ?v5 ?v4) (pred_6 ?v4) (pred_5))
       :effect (and (pred_4 ?v5)
		    (not (pred_2 ?v5 ?v4)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v5  ?v4)
       :precondition  (and  (pred_1 ?v5) (pred_3 ?v4)
			    (pred_4 ?v5) (pred_6 ?v4))
       :effect (and (pred_2 ?v5 ?v4)
		    (pred_5)
		    (not (pred_4 ?v5)))))
