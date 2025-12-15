(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v8 ?v1)
		(pred_2 ?v5)
		(pred_6 ?v4)
		(pred_4 ?v4)
		(pred_3 ?v5 ?v4)
		(pred_1)
		(pred_5 ?v5))

   (:action op_2
       :parameters  (?v3 ?v7)
       :precondition (and (not-eq ?v3 ?v7) 
                          (pred_6 ?v3) (pred_6 ?v7) (pred_4 ?v3))
       :effect (and  (pred_4 ?v7)
		     (not (pred_4 ?v3))))


   (:action op_1
       :parameters (?v6 ?v2)
       :precondition  (and  (pred_2 ?v6) (pred_6 ?v2)
			    (pred_3 ?v6 ?v2) (pred_4 ?v2) (pred_1))
       :effect (and (pred_5 ?v6)
		    (not (pred_3 ?v6 ?v2)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v6  ?v2)
       :precondition  (and  (pred_2 ?v6) (pred_6 ?v2)
			    (pred_5 ?v6) (pred_4 ?v2))
       :effect (and (pred_3 ?v6 ?v2)
		    (pred_1)
		    (not (pred_5 ?v6)))))
