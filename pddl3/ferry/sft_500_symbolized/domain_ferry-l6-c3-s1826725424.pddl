(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v1)
		(pred_5 ?v8)
		(pred_1 ?v5)
		(pred_4 ?v5)
		(pred_6 ?v8 ?v5)
		(pred_3)
		(pred_2 ?v8))

   (:action op_3
       :parameters  (?v4 ?v7)
       :precondition (and (not-eq ?v4 ?v7) 
                          (pred_1 ?v4) (pred_1 ?v7) (pred_4 ?v4))
       :effect (and  (pred_4 ?v7)
		     (not (pred_4 ?v4))))


   (:action op_2
       :parameters (?v6 ?v2)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v2)
			    (pred_6 ?v6 ?v2) (pred_4 ?v2) (pred_3))
       :effect (and (pred_2 ?v6)
		    (not (pred_6 ?v6 ?v2)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v6  ?v2)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v2)
			    (pred_2 ?v6) (pred_4 ?v2))
       :effect (and (pred_6 ?v6 ?v2)
		    (pred_3)
		    (not (pred_2 ?v6)))))
