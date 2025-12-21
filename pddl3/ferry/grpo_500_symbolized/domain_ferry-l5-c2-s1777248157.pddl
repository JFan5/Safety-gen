(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v5)
		(pred_6 ?v1)
		(pred_4 ?v8)
		(pred_5 ?v8)
		(pred_1 ?v1 ?v8)
		(pred_3)
		(pred_2 ?v1))

   (:action op_1
       :parameters  (?v3 ?v4)
       :precondition (and (not-eq ?v3 ?v4) 
                          (pred_4 ?v3) (pred_4 ?v4) (pred_5 ?v3))
       :effect (and  (pred_5 ?v4)
		     (not (pred_5 ?v3))))


   (:action op_3
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_6 ?v7) (pred_4 ?v6)
			    (pred_1 ?v7 ?v6) (pred_5 ?v6) (pred_3))
       :effect (and (pred_2 ?v7)
		    (not (pred_1 ?v7 ?v6)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_6 ?v7) (pred_4 ?v6)
			    (pred_2 ?v7) (pred_5 ?v6))
       :effect (and (pred_1 ?v7 ?v6)
		    (pred_3)
		    (not (pred_2 ?v7)))))
