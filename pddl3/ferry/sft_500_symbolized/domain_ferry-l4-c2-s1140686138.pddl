(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v3)
		(pred_6 ?v7)
		(pred_2 ?v8)
		(pred_1 ?v8)
		(pred_4 ?v7 ?v8)
		(pred_3)
		(pred_5 ?v7))

   (:action op_2
       :parameters  (?v6 ?v4)
       :precondition (and (not-eq ?v6 ?v4) 
                          (pred_2 ?v6) (pred_2 ?v4) (pred_1 ?v6))
       :effect (and  (pred_1 ?v4)
		     (not (pred_1 ?v6))))


   (:action op_1
       :parameters (?v2 ?v5)
       :precondition  (and  (pred_6 ?v2) (pred_2 ?v5)
			    (pred_4 ?v2 ?v5) (pred_1 ?v5) (pred_3))
       :effect (and (pred_5 ?v2)
		    (not (pred_4 ?v2 ?v5)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v2  ?v5)
       :precondition  (and  (pred_6 ?v2) (pred_2 ?v5)
			    (pred_5 ?v2) (pred_1 ?v5))
       :effect (and (pred_4 ?v2 ?v5)
		    (pred_3)
		    (not (pred_5 ?v2)))))
