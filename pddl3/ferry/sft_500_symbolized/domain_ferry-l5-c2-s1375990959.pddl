(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v8)
		(pred_4 ?v7)
		(pred_1 ?v4)
		(pred_5 ?v4)
		(pred_2 ?v7 ?v4)
		(pred_6)
		(pred_3 ?v7))

   (:action op_1
       :parameters  (?v3 ?v5)
       :precondition (and (not-eq ?v3 ?v5) 
                          (pred_1 ?v3) (pred_1 ?v5) (pred_5 ?v3))
       :effect (and  (pred_5 ?v5)
		     (not (pred_5 ?v3))))


   (:action op_3
       :parameters (?v6 ?v2)
       :precondition  (and  (pred_4 ?v6) (pred_1 ?v2)
			    (pred_2 ?v6 ?v2) (pred_5 ?v2) (pred_6))
       :effect (and (pred_3 ?v6)
		    (not (pred_2 ?v6 ?v2)) 
		    (not (pred_6))))

   (:action op_2
       :parameters  (?v6  ?v2)
       :precondition  (and  (pred_4 ?v6) (pred_1 ?v2)
			    (pred_3 ?v6) (pred_5 ?v2))
       :effect (and (pred_2 ?v6 ?v2)
		    (pred_6)
		    (not (pred_3 ?v6)))))
