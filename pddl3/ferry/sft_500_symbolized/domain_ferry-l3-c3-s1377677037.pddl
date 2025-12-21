(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v8)
		(pred_1 ?v6)
		(pred_6 ?v4)
		(pred_4 ?v4)
		(pred_5 ?v6 ?v4)
		(pred_3)
		(pred_2 ?v6))

   (:action op_2
       :parameters  (?v7 ?v3)
       :precondition (and (not-eq ?v7 ?v3) 
                          (pred_6 ?v7) (pred_6 ?v3) (pred_4 ?v7))
       :effect (and  (pred_4 ?v3)
		     (not (pred_4 ?v7))))


   (:action op_1
       :parameters (?v5 ?v2)
       :precondition  (and  (pred_1 ?v5) (pred_6 ?v2)
			    (pred_5 ?v5 ?v2) (pred_4 ?v2) (pred_3))
       :effect (and (pred_2 ?v5)
		    (not (pred_5 ?v5 ?v2)) 
		    (not (pred_3))))

   (:action op_3
       :parameters  (?v5  ?v2)
       :precondition  (and  (pred_1 ?v5) (pred_6 ?v2)
			    (pred_2 ?v5) (pred_4 ?v2))
       :effect (and (pred_5 ?v5 ?v2)
		    (pred_3)
		    (not (pred_2 ?v5)))))
