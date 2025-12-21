(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v5 ?v4)
		(pred_1 ?v7)
		(pred_6 ?v8)
		(pred_2 ?v8)
		(pred_5 ?v7 ?v8)
		(pred_3)
		(pred_4 ?v7))

   (:action op_2
       :parameters  (?v2 ?v3)
       :precondition (and (not-eq ?v2 ?v3) 
                          (pred_6 ?v2) (pred_6 ?v3) (pred_2 ?v2))
       :effect (and  (pred_2 ?v3)
		     (not (pred_2 ?v2))))


   (:action op_3
       :parameters (?v6 ?v1)
       :precondition  (and  (pred_1 ?v6) (pred_6 ?v1)
			    (pred_5 ?v6 ?v1) (pred_2 ?v1) (pred_3))
       :effect (and (pred_4 ?v6)
		    (not (pred_5 ?v6 ?v1)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v6  ?v1)
       :precondition  (and  (pred_1 ?v6) (pred_6 ?v1)
			    (pred_4 ?v6) (pred_2 ?v1))
       :effect (and (pred_5 ?v6 ?v1)
		    (pred_3)
		    (not (pred_4 ?v6)))))
