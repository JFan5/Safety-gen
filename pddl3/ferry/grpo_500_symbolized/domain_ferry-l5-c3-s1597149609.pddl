(define (domain ferry)
  (:requirements :strips :constraints :negative-preconditions)
   (:predicates (not-eq ?v4 ?v8)
		(pred_3 ?v3)
		(pred_1 ?v1)
		(pred_6 ?v1)
		(pred_5 ?v3 ?v1)
		(pred_2)
		(pred_4 ?v3))

   (:action op_3
       :parameters  (?v7 ?v5)
       :precondition (and (not-eq ?v7 ?v5) 
                          (pred_1 ?v7) (pred_1 ?v5) (pred_6 ?v7))
       :effect (and  (pred_6 ?v5)
		     (not (pred_6 ?v7))))


   (:action op_1
       :parameters (?v2 ?v6)
       :precondition  (and  (pred_3 ?v2) (pred_1 ?v6)
			    (pred_5 ?v2 ?v6) (pred_6 ?v6) (pred_2))
       :effect (and (pred_4 ?v2)
		    (not (pred_5 ?v2 ?v6)) 
		    (not (pred_2))))

   (:action op_2
       :parameters  (?v2  ?v6)
       :precondition  (and  (pred_3 ?v2) (pred_1 ?v6)
			    (pred_4 ?v2) (pred_6 ?v6))
       :effect (and (pred_5 ?v2 ?v6)
		    (pred_2)
		    (not (pred_4 ?v2)))))
