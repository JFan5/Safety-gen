(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v3 ?v1)
		(pred_2 ?v8)
		(pred_5 ?v2)
		(pred_4 ?v2)
		(pred_6 ?v8 ?v2)
		(pred_1)
		(pred_3 ?v8))

   (:action op_1
       :parameters  (?v5 ?v4)
       :precondition (and (not-eq ?v5 ?v4) 
                          (pred_5 ?v5) (pred_5 ?v4) (pred_4 ?v5))
       :effect (and  (pred_4 ?v4)
		     (not (pred_4 ?v5))))


   (:action op_2
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_2 ?v7) (pred_5 ?v6)
			    (pred_6 ?v7 ?v6) (pred_4 ?v6) (pred_1))
       :effect (and (pred_3 ?v7)
		    (not (pred_6 ?v7 ?v6)) 
		    (not (pred_1))))

   (:action op_3
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_2 ?v7) (pred_5 ?v6)
			    (pred_3 ?v7) (pred_4 ?v6))
       :effect (and (pred_6 ?v7 ?v6)
		    (pred_1)
		    (not (pred_3 ?v7)))))
