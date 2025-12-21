(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v3)
		(pred_4 ?v2)
		(pred_2 ?v8)
		(pred_5 ?v8)
		(pred_1 ?v2 ?v8)
		(pred_3)
		(pred_6 ?v2))

   (:action op_2
       :parameters  (?v1 ?v7)
       :precondition (and (not-eq ?v1 ?v7) 
                          (pred_2 ?v1) (pred_2 ?v7) (pred_5 ?v1))
       :effect (and  (pred_5 ?v7)
		     (not (pred_5 ?v1))))


   (:action op_3
       :parameters (?v5 ?v6)
       :precondition  (and  (pred_4 ?v5) (pred_2 ?v6)
			    (pred_1 ?v5 ?v6) (pred_5 ?v6) (pred_3))
       :effect (and (pred_6 ?v5)
		    (not (pred_1 ?v5 ?v6)) 
		    (not (pred_3))))

   (:action op_1
       :parameters  (?v5  ?v6)
       :precondition  (and  (pred_4 ?v5) (pred_2 ?v6)
			    (pred_6 ?v5) (pred_5 ?v6))
       :effect (and (pred_1 ?v5 ?v6)
		    (pred_3)
		    (not (pred_6 ?v5)))))
