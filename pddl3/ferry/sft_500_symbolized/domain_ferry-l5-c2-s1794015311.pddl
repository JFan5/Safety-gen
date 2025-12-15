(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v8)
		(pred_3 ?v6)
		(pred_1 ?v7)
		(pred_5 ?v7)
		(pred_4 ?v6 ?v7)
		(pred_6)
		(pred_2 ?v6))

   (:action op_1
       :parameters  (?v3 ?v2)
       :precondition (and (not-eq ?v3 ?v2) 
                          (pred_1 ?v3) (pred_1 ?v2) (pred_5 ?v3))
       :effect (and  (pred_5 ?v2)
		     (not (pred_5 ?v3))))


   (:action op_2
       :parameters (?v4 ?v5)
       :precondition  (and  (pred_3 ?v4) (pred_1 ?v5)
			    (pred_4 ?v4 ?v5) (pred_5 ?v5) (pred_6))
       :effect (and (pred_2 ?v4)
		    (not (pred_4 ?v4 ?v5)) 
		    (not (pred_6))))

   (:action op_3
       :parameters  (?v4  ?v5)
       :precondition  (and  (pred_3 ?v4) (pred_1 ?v5)
			    (pred_2 ?v4) (pred_5 ?v5))
       :effect (and (pred_4 ?v4 ?v5)
		    (pred_6)
		    (not (pred_2 ?v4)))))
