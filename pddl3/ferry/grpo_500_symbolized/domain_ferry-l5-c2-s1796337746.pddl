(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v1)
		(pred_5 ?v8)
		(pred_6 ?v3)
		(pred_4 ?v3)
		(pred_2 ?v8 ?v3)
		(pred_3)
		(pred_1 ?v8))

   (:action op_3
       :parameters  (?v2 ?v6)
       :precondition (and (not-eq ?v2 ?v6) 
                          (pred_6 ?v2) (pred_6 ?v6) (pred_4 ?v2))
       :effect (and  (pred_4 ?v6)
		     (not (pred_4 ?v2))))


   (:action op_1
       :parameters (?v4 ?v7)
       :precondition  (and  (pred_5 ?v4) (pred_6 ?v7)
			    (pred_2 ?v4 ?v7) (pred_4 ?v7) (pred_3))
       :effect (and (pred_1 ?v4)
		    (not (pred_2 ?v4 ?v7)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v4  ?v7)
       :precondition  (and  (pred_5 ?v4) (pred_6 ?v7)
			    (pred_1 ?v4) (pred_4 ?v7))
       :effect (and (pred_2 ?v4 ?v7)
		    (pred_3)
		    (not (pred_1 ?v4)))))
