(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v7 ?v1)
		(pred_6 ?v2)
		(pred_1 ?v4)
		(pred_4 ?v4)
		(pred_5 ?v2 ?v4)
		(pred_3)
		(pred_2 ?v2))

   (:action op_3
       :parameters  (?v6 ?v8)
       :precondition (and (not-eq ?v6 ?v8) 
                          (pred_1 ?v6) (pred_1 ?v8) (pred_4 ?v6))
       :effect (and  (pred_4 ?v8)
		     (not (pred_4 ?v6))))


   (:action op_2
       :parameters (?v5 ?v3)
       :precondition  (and  (pred_6 ?v5) (pred_1 ?v3)
			    (pred_5 ?v5 ?v3) (pred_4 ?v3) (pred_3))
       :effect (and (pred_2 ?v5)
		    (not (pred_5 ?v5 ?v3)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v5  ?v3)
       :precondition  (and  (pred_6 ?v5) (pred_1 ?v3)
			    (pred_2 ?v5) (pred_4 ?v3))
       :effect (and (pred_5 ?v5 ?v3)
		    (pred_3)
		    (not (pred_2 ?v5)))))
