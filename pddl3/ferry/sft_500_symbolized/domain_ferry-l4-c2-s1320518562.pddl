(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v4)
		(pred_2 ?v1)
		(pred_1 ?v7)
		(pred_6 ?v7)
		(pred_3 ?v1 ?v7)
		(pred_4)
		(pred_5 ?v1))

   (:action op_1
       :parameters  (?v3 ?v6)
       :precondition (and (not-eq ?v3 ?v6) 
                          (pred_1 ?v3) (pred_1 ?v6) (pred_6 ?v3))
       :effect (and  (pred_6 ?v6)
		     (not (pred_6 ?v3))))


   (:action op_3
       :parameters (?v5 ?v2)
       :precondition  (and  (pred_2 ?v5) (pred_1 ?v2)
			    (pred_3 ?v5 ?v2) (pred_6 ?v2) (pred_4))
       :effect (and (pred_5 ?v5)
		    (not (pred_3 ?v5 ?v2)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v5  ?v2)
       :precondition  (and  (pred_2 ?v5) (pred_1 ?v2)
			    (pred_5 ?v5) (pred_6 ?v2))
       :effect (and (pred_3 ?v5 ?v2)
		    (pred_4)
		    (not (pred_5 ?v5)))))
