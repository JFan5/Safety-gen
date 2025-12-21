(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v1 ?v8)
		(pred_3 ?v7)
		(pred_2 ?v4)
		(pred_6 ?v4)
		(pred_5 ?v7 ?v4)
		(pred_1)
		(pred_4 ?v7))

   (:action op_3
       :parameters  (?v5 ?v2)
       :precondition (and (not-eq ?v5 ?v2) 
                          (pred_2 ?v5) (pred_2 ?v2) (pred_6 ?v5))
       :effect (and  (pred_6 ?v2)
		     (not (pred_6 ?v5))))


   (:action op_1
       :parameters (?v3 ?v6)
       :precondition  (and  (pred_3 ?v3) (pred_2 ?v6)
			    (pred_5 ?v3 ?v6) (pred_6 ?v6) (pred_1))
       :effect (and (pred_4 ?v3)
		    (not (pred_5 ?v3 ?v6)) 
		    (not (pred_1))))

   (:action op_2
       :parameters  (?v3  ?v6)
       :precondition  (and  (pred_3 ?v3) (pred_2 ?v6)
			    (pred_4 ?v3) (pred_6 ?v6))
       :effect (and (pred_5 ?v3 ?v6)
		    (pred_1)
		    (not (pred_4 ?v3)))))
