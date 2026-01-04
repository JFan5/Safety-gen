(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v3)
		(pred_2 ?v2)
		(pred_4 ?v1)
		(pred_5 ?v1)
		(pred_6 ?v2 ?v1)
		(pred_3)
		(pred_1 ?v2))

   (:action op_3
       :parameters  (?v4 ?v8)
       :precondition (and (not-eq ?v4 ?v8) 
                          (pred_4 ?v4) (pred_4 ?v8) (pred_5 ?v4))
       :effect (and  (pred_5 ?v8)
		     (not (pred_5 ?v4))))


   (:action op_1
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_2 ?v7) (pred_4 ?v6)
			    (pred_6 ?v7 ?v6) (pred_5 ?v6) (pred_3))
       :effect (and (pred_1 ?v7)
		    (not (pred_6 ?v7 ?v6)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_2 ?v7) (pred_4 ?v6)
			    (pred_1 ?v7) (pred_5 ?v6))
       :effect (and (pred_6 ?v7 ?v6)
		    (pred_3)
		    (not (pred_1 ?v7)))))
