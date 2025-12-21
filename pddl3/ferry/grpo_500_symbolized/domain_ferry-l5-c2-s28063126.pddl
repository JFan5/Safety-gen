(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v1)
		(pred_5 ?v8)
		(pred_6 ?v7)
		(pred_2 ?v7)
		(pred_1 ?v8 ?v7)
		(pred_3)
		(pred_4 ?v8))

   (:action op_1
       :parameters  (?v6 ?v4)
       :precondition (and (not-eq ?v6 ?v4) 
                          (pred_6 ?v6) (pred_6 ?v4) (pred_2 ?v6))
       :effect (and  (pred_2 ?v4)
		     (not (pred_2 ?v6))))


   (:action op_2
       :parameters (?v3 ?v5)
       :precondition  (and  (pred_5 ?v3) (pred_6 ?v5)
			    (pred_1 ?v3 ?v5) (pred_2 ?v5) (pred_3))
       :effect (and (pred_4 ?v3)
		    (not (pred_1 ?v3 ?v5)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v3  ?v5)
       :precondition  (and  (pred_5 ?v3) (pred_6 ?v5)
			    (pred_4 ?v3) (pred_2 ?v5))
       :effect (and (pred_1 ?v3 ?v5)
		    (pred_3)
		    (not (pred_4 ?v3)))))
