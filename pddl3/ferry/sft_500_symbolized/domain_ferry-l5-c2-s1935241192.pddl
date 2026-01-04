(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_2 ?v2)
		(pred_4 ?v1)
		(pred_6 ?v1)
		(pred_1 ?v2 ?v1)
		(pred_5)
		(pred_3 ?v2))

   (:action op_1
       :parameters  (?v6 ?v7)
       :precondition (and (not-eq ?v6 ?v7) 
                          (pred_4 ?v6) (pred_4 ?v7) (pred_6 ?v6))
       :effect (and  (pred_6 ?v7)
		     (not (pred_6 ?v6))))


   (:action op_2
       :parameters (?v5 ?v4)
       :precondition  (and  (pred_2 ?v5) (pred_4 ?v4)
			    (pred_1 ?v5 ?v4) (pred_6 ?v4) (pred_5))
       :effect (and (pred_3 ?v5)
		    (not (pred_1 ?v5 ?v4)) 
		    (not (pred_5))))

   (:action op_3
       :parameters  (?v5  ?v4)
       :precondition  (and  (pred_2 ?v5) (pred_4 ?v4)
			    (pred_3 ?v5) (pred_6 ?v4))
       :effect (and (pred_1 ?v5 ?v4)
		    (pred_5)
		    (not (pred_3 ?v5)))))
