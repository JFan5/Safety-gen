(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v6)
		(pred_1 ?v1)
		(pred_6 ?v2)
		(pred_2 ?v2)
		(pred_5 ?v1 ?v2)
		(pred_4)
		(pred_3 ?v1))

   (:action op_3
       :parameters  (?v4 ?v3)
       :precondition (and (not-eq ?v4 ?v3) 
                          (pred_6 ?v4) (pred_6 ?v3) (pred_2 ?v4))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v4))))


   (:action op_2
       :parameters (?v7 ?v5)
       :precondition  (and  (pred_1 ?v7) (pred_6 ?v5)
			    (pred_5 ?v7 ?v5) (pred_2 ?v5) (pred_4))
       :effect (and (pred_3 ?v7)
		    (not (pred_5 ?v7 ?v5)) 
		    (not (pred_4))))

   (:action op_1
       :parameters  (?v7  ?v5)
       :precondition  (and  (pred_1 ?v7) (pred_6 ?v5)
			    (pred_3 ?v7) (pred_2 ?v5))
       :effect (and (pred_5 ?v7 ?v5)
		    (pred_4)
		    (not (pred_3 ?v7)))))
