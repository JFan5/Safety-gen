(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v2)
		(pred_1 ?v1)
		(pred_6 ?v5)
		(pred_5 ?v5)
		(pred_2 ?v1 ?v5)
		(pred_4)
		(pred_3 ?v1))

   (:action op_1
       :parameters  (?v3 ?v4)
       :precondition (and (not-eq ?v3 ?v4) 
                          (pred_6 ?v3) (pred_6 ?v4) (pred_5 ?v3))
       :effect (and  (pred_5 ?v4)
		     (not (pred_5 ?v3))))


   (:action op_3
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_1 ?v7) (pred_6 ?v6)
			    (pred_2 ?v7 ?v6) (pred_5 ?v6) (pred_4))
       :effect (and (pred_3 ?v7)
		    (not (pred_2 ?v7 ?v6)) 
		    (not (pred_4))))

   (:action op_2
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_1 ?v7) (pred_6 ?v6)
			    (pred_3 ?v7) (pred_5 ?v6))
       :effect (and (pred_2 ?v7 ?v6)
		    (pred_4)
		    (not (pred_3 ?v7)))))
