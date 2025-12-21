(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v2)
		(pred_4 ?v7)
		(pred_6 ?v3)
		(pred_5 ?v3)
		(pred_3 ?v7 ?v3)
		(pred_1)
		(pred_2 ?v7))

   (:action op_2
       :parameters  (?v8 ?v6)
       :precondition (and (not-eq ?v8 ?v6) 
                          (pred_6 ?v8) (pred_6 ?v6) (pred_5 ?v8))
       :effect (and  (pred_5 ?v6)
		     (not (pred_5 ?v8))))


   (:action op_3
       :parameters (?v5 ?v4)
       :precondition  (and  (pred_4 ?v5) (pred_6 ?v4)
			    (pred_3 ?v5 ?v4) (pred_5 ?v4) (pred_1))
       :effect (and (pred_2 ?v5)
		    (not (pred_3 ?v5 ?v4)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v5  ?v4)
       :precondition  (and  (pred_4 ?v5) (pred_6 ?v4)
			    (pred_2 ?v5) (pred_5 ?v4))
       :effect (and (pred_3 ?v5 ?v4)
		    (pred_1)
		    (not (pred_2 ?v5)))))
