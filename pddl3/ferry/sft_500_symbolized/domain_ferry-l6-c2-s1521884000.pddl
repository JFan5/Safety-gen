(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v2)
		(pred_5 ?v8)
		(pred_3 ?v7)
		(pred_6 ?v7)
		(pred_4 ?v8 ?v7)
		(pred_1)
		(pred_2 ?v8))

   (:action op_1
       :parameters  (?v4 ?v5)
       :precondition (and (not-eq ?v4 ?v5) 
                          (pred_3 ?v4) (pred_3 ?v5) (pred_6 ?v4))
       :effect (and  (pred_6 ?v5)
		     (not (pred_6 ?v4))))


   (:action op_2
       :parameters (?v6 ?v1)
       :precondition  (and  (pred_5 ?v6) (pred_3 ?v1)
			    (pred_4 ?v6 ?v1) (pred_6 ?v1) (pred_1))
       :effect (and (pred_2 ?v6)
		    (not (pred_4 ?v6 ?v1)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v6  ?v1)
       :precondition  (and  (pred_5 ?v6) (pred_3 ?v1)
			    (pred_2 ?v6) (pred_6 ?v1))
       :effect (and (pred_4 ?v6 ?v1)
		    (pred_1)
		    (not (pred_2 ?v6)))))
