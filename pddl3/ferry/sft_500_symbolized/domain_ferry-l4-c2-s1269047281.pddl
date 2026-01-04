(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v2 ?v1)
		(pred_6 ?v8)
		(pred_2 ?v5)
		(pred_4 ?v5)
		(pred_5 ?v8 ?v5)
		(pred_1)
		(pred_3 ?v8))

   (:action op_1
       :parameters  (?v3 ?v6)
       :precondition (and (not-eq ?v3 ?v6) 
                          (pred_2 ?v3) (pred_2 ?v6) (pred_4 ?v3))
       :effect (and  (pred_4 ?v6)
		     (not (pred_4 ?v3))))


   (:action op_3
       :parameters (?v4 ?v7)
       :precondition  (and  (pred_6 ?v4) (pred_2 ?v7)
			    (pred_5 ?v4 ?v7) (pred_4 ?v7) (pred_1))
       :effect (and (pred_3 ?v4)
		    (not (pred_5 ?v4 ?v7)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v4  ?v7)
       :precondition  (and  (pred_6 ?v4) (pred_2 ?v7)
			    (pred_3 ?v4) (pred_4 ?v7))
       :effect (and (pred_5 ?v4 ?v7)
		    (pred_1)
		    (not (pred_3 ?v4)))))
