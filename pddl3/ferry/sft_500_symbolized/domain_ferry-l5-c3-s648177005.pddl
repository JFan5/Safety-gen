(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v5)
		(pred_2 ?v3)
		(pred_3 ?v8)
		(pred_4 ?v8)
		(pred_6 ?v3 ?v8)
		(pred_1)
		(pred_5 ?v3))

   (:action op_2
       :parameters  (?v2 ?v1)
       :precondition (and (not-eq ?v2 ?v1) 
                          (pred_3 ?v2) (pred_3 ?v1) (pred_4 ?v2))
       :effect (and  (pred_4 ?v1)
		     (not (pred_4 ?v2))))


   (:action op_3
       :parameters (?v7 ?v6)
       :precondition  (and  (pred_2 ?v7) (pred_3 ?v6)
			    (pred_6 ?v7 ?v6) (pred_4 ?v6) (pred_1))
       :effect (and (pred_5 ?v7)
		    (not (pred_6 ?v7 ?v6)) 
		    (not (pred_1))))

   (:action op_1
       :parameters  (?v7  ?v6)
       :precondition  (and  (pred_2 ?v7) (pred_3 ?v6)
			    (pred_5 ?v7) (pred_4 ?v6))
       :effect (and (pred_6 ?v7 ?v6)
		    (pred_1)
		    (not (pred_5 ?v7)))))
