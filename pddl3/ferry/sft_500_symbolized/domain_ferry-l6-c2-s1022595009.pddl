(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v8)
		(pred_5 ?v2)
		(pred_1 ?v4)
		(pred_6 ?v4)
		(pred_2 ?v2 ?v4)
		(pred_3)
		(pred_4 ?v2))

   (:action op_1
       :parameters  (?v1 ?v5)
       :precondition (and (not-eq ?v1 ?v5) 
                          (pred_1 ?v1) (pred_1 ?v5) (pred_6 ?v1))
       :effect (and  (pred_6 ?v5)
		     (not (pred_6 ?v1))))


   (:action op_3
       :parameters (?v6 ?v7)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v7)
			    (pred_2 ?v6 ?v7) (pred_6 ?v7) (pred_3))
       :effect (and (pred_4 ?v6)
		    (not (pred_2 ?v6 ?v7)) 
		    (not (pred_3))))

   (:action op_2
       :parameters  (?v6  ?v7)
       :precondition  (and  (pred_5 ?v6) (pred_1 ?v7)
			    (pred_4 ?v6) (pred_6 ?v7))
       :effect (and (pred_2 ?v6 ?v7)
		    (pred_3)
		    (not (pred_4 ?v6)))))
