(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v3)
		(pred_1 ?v7)
		(pred_6 ?v1)
		(pred_2 ?v1)
		(pred_4 ?v7 ?v1)
		(pred_3)
		(pred_5 ?v7))

   (:action op_2
       :parameters  (?v6 ?v8)
       :precondition (and (not-eq ?v6 ?v8) 
                          (pred_6 ?v6) (pred_6 ?v8) (pred_2 ?v6))
       :effect (and  (pred_2 ?v8)
		     (not (pred_2 ?v6))))


   (:action op_1
       :parameters (?v5 ?v4)
       :precondition  (and  (pred_1 ?v5) (pred_6 ?v4)
			    (pred_4 ?v5 ?v4) (pred_2 ?v4) (pred_3))
       :effect (and (pred_5 ?v5)
		    (not (pred_4 ?v5 ?v4)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v5  ?v4)
       :precondition  (and  (pred_1 ?v5) (pred_6 ?v4)
			    (pred_5 ?v5) (pred_2 ?v4))
       :effect (and (pred_4 ?v5 ?v4)
		    (pred_3)
		    (not (pred_5 ?v5)))))
