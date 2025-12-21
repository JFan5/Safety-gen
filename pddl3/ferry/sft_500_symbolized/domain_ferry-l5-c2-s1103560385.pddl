(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v4)
		(pred_1 ?v2)
		(pred_2 ?v5)
		(pred_3 ?v5)
		(pred_6 ?v2 ?v5)
		(pred_4)
		(pred_5 ?v2))

   (:action op_3
       :parameters  (?v3 ?v1)
       :precondition (and (not-eq ?v3 ?v1) 
                          (pred_2 ?v3) (pred_2 ?v1) (pred_3 ?v3))
       :effect (and  (pred_3 ?v1)
		     (not (pred_3 ?v3))))


   (:action op_2
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_1 ?v7) (pred_2 ?v6)
			    (pred_6 ?v7 ?v6) (pred_3 ?v6) (pred_4))
       :effect (and (pred_5 ?v7)
		    (not (pred_6 ?v7 ?v6)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_1 ?v7) (pred_2 ?v6)
			    (pred_5 ?v7) (pred_3 ?v6))
       :effect (and (pred_6 ?v7 ?v6)
		    (pred_4)
		    (not (pred_5 ?v7)))))
